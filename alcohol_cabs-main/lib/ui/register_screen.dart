import 'package:alcohol_cabs/services/database_service.dart';
import 'package:alcohol_cabs/ui/auth_service.dart';
import 'package:alcohol_cabs/ui/upload_license.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String licensePhotoUrl = "";
  TextEditingController licenseNumber = TextEditingController();
  TextEditingController carNumber = TextEditingController();
  TextEditingController homeAddress = TextEditingController();
  TextEditingController emergencyContact1 = TextEditingController();
  TextEditingController emergencyContact2 = TextEditingController();
  TextEditingController emergencyContact3 = TextEditingController();
  TextEditingController emergencyContact1Name = TextEditingController();
  TextEditingController emergencyContact2Name = TextEditingController();
  TextEditingController emergencyContact3Name = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: SingleChildScrollView(
          child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                //validator: InputValidators().validateEmptyFields,
                controller: licenseNumber,
                decoration: InputDecoration(
                  labelText: 'License Number',
                  contentPadding: EdgeInsets.all(8),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusColor: Colors.black,
                  labelStyle: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                //validator: InputValidators().validateEmptyFields,
                controller: carNumber,
                decoration: InputDecoration(
                  labelText: 'Car Number',
                  contentPadding: EdgeInsets.all(8),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusColor: Colors.black,
                  labelStyle: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                maxLines: 5,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                //validator: InputValidators().validateEmptyFields,
                controller: homeAddress,
                decoration: InputDecoration(
                  labelText: 'home Address',
                  contentPadding: EdgeInsets.all(8),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusColor: Colors.black,
                  labelStyle: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                maxLines: 5,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                //validator: InputValidators().validateEmptyFields,
                controller: emergencyContact1Name,
                decoration: InputDecoration(
                  labelText: 'emergencyContact1Name',
                  contentPadding: EdgeInsets.all(8),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusColor: Colors.black,
                  labelStyle: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                maxLines: 5,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                //validator: InputValidators().validateEmptyFields,
                controller: emergencyContact1,
                decoration: InputDecoration(
                  labelText: 'emergencyContact1',
                  contentPadding: EdgeInsets.all(8),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusColor: Colors.black,
                  labelStyle: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                maxLines: 5,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                //validator: InputValidators().validateEmptyFields,
                controller: emergencyContact2Name,
                decoration: InputDecoration(
                  labelText: 'emergencyContact2Name',
                  contentPadding: EdgeInsets.all(8),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusColor: Colors.black,
                  labelStyle: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                maxLines: 5,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                //validator: InputValidators().validateEmptyFields,
                controller: emergencyContact2,
                decoration: InputDecoration(
                  labelText: 'emergencyContact2',
                  contentPadding: EdgeInsets.all(8),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusColor: Colors.black,
                  labelStyle: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                maxLines: 5,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                //validator: InputValidators().validateEmptyFields,
                controller: emergencyContact3Name,
                decoration: InputDecoration(
                  labelText: 'emergencyContact3Name',
                  contentPadding: EdgeInsets.all(8),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusColor: Colors.black,
                  labelStyle: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                maxLines: 5,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                //validator: InputValidators().validateEmptyFields,
                controller: emergencyContact3,
                decoration: InputDecoration(
                  labelText: 'emergencyContact3',
                  contentPadding: EdgeInsets.all(8),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusColor: Colors.black,
                  labelStyle: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextButton(
                onPressed: () {
                  Map<String, dynamic> mp = {
                    'licenseNumber': licenseNumber.text,
                    'carNumber': carNumber.text,
                    'homeAddress': homeAddress.text,
                    'emergencyContact1': emergencyContact1.text,
                    'emergencyContact1Name': emergencyContact1Name.text,
                    'emergencyContact2': emergencyContact2.text,
                    'emergencyContact2Name': emergencyContact2Name.text,
                    'emergencyContact3': emergencyContact3.text,
                    'emergencyContact3Name': emergencyContact3Name.text,
                    'register': true
                  };

                  User user = AuthService().getCurrentUser();
                  DatabaseService(uid: user.uid).updateUser(mp);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UploadLicense()),
                  );
                },
                child: const Text(
                  'Register',
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
