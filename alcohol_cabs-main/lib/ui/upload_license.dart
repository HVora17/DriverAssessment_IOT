import 'dart:io';

import 'package:alcohol_cabs/services/database_service.dart';
import 'package:alcohol_cabs/ui/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as Im;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../services/object_store_service.dart';

class UploadLicense extends StatefulWidget {
  const UploadLicense({ Key? key }) : super(key: key);

  @override
  State<UploadLicense> createState() => _UploadLicenseState();
}

class _UploadLicenseState extends State<UploadLicense> {

  bool isImage = false ; 
  final _picker = ImagePicker();
  String imageURL = '';
  late File file ; 


  compressImage(filename) async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image? imageFile = Im.decodeImage(file.readAsBytesSync());
    final compressedImageFile = File('$path/img_$filename.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile!, quality: 85));
    setState(() {
      file = compressedImageFile;
    });
  }

  Future handleImageUpload() async {
    DateTime now = DateTime.now() ;
    await compressImage(now.toString());
    var uuid = Uuid();
    String uid = uuid.v1();
    String mediaUrl = await uploadImage(
        file,  uid + "-" + now.toString());
    
      imageURL = mediaUrl;
      User user = AuthService().getCurrentUser();
      Map<String , dynamic> mp = {
        'license_url': imageURL
      };
    DatabaseService(uid: user.uid).updateUser(mp);
    Navigator.pop(context);
    return true;
  }

   handleTakePhoto() async {
    Navigator.pop(context);
    PickedFile? pickerfile = await _picker.getImage(
      source: ImageSource.camera,
      maxHeight: 675,
      maxWidth: 960,
    );
    File file = File(pickerfile!.path);
    isImage = true;
    this.file = file;
    // ignore: unnecessary_null_comparison
    if (file != null) {
      handleImageUpload() ;
      Fluttertoast.showToast(msg: "Images Uploaded");
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }

  handleChooseFromGallery() async {
    Navigator.pop(context);
    PickedFile? pickerfile = await _picker.getImage(source: ImageSource.gallery);
    File file = File(pickerfile!.path);
    isImage = true;
    this.file = file;
    if (file != null) {
      handleImageUpload();
      Fluttertoast.showToast(msg: "Images Uploaded");
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }

  selectImage(parentContext) {
    return showDialog(
      context: parentContext,
      builder: (context) {
        return SimpleDialog(
          title: Text("Upload Image"),
          children: <Widget>[
            SimpleDialogOption(
                child: Text("Photo with Camera"),
                onPressed: () => handleTakePhoto()),
            SimpleDialogOption(
                child: Text("Image from Gallery"),
                onPressed: () => handleChooseFromGallery()),
            SimpleDialogOption(
              child: Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const  Text('Upload License'),
      ),

      body: Column(
        children: [
          TextButton(onPressed: (){
            selectImage(context); 
          }, child: const Text('Upload License for verification'))
        ],
      ),



      
    );
  }
}