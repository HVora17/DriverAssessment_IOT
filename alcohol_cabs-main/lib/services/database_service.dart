
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');


  Future<void> addUser(User? user) async {
    return await usersCollection.doc(uid).set({
      "created_at": DateTime.now(),
      "updated_at": DateTime.now(),
      "uid": uid,
      "login_at": user!.metadata.lastSignInTime,
      "name": user.displayName,
      "DOB": " ",
      "profile_pic": user.photoURL,
      "licenseNumber": "",
      "carNumber": "",
      "homeAddress": "",
      "emergencyContact1": "",
      "emergencyContact1Name": "",
      "emergencyContact2": "",
      "emergencyContact2Name": "",
      "emergencyContact3": "",
      "emergencyContact3Name": "",
      "phone": user.phoneNumber,
      "email": user.email,
      "register":false,
      "license_url" :""
    });
  }

  Future<void> updateUser(Map<String, dynamic> data) async {
    return await usersCollection.doc(uid).update(data);
  }

}
