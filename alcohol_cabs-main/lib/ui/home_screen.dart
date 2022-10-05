import 'package:alcohol_cabs/services/database_service.dart';
import 'package:alcohol_cabs/services/sms_cab_service.dart';
import 'package:alcohol_cabs/ui/auth_service.dart';
import 'package:alcohol_cabs/ui/register_screen.dart';
import 'package:alcohol_cabs/ui/sms_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late User user;
  late var final_user_doc;

  @override
  void initState() {
    user = AuthService().getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('HomeScreen'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SmsReaderScreen(
                      final_user_doc
                    )),
                  );
                },
                icon: Icon(Icons.sms))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.taxi_alert),
          onPressed: () {
            sendSMSansBookCabs(final_user_doc , "Pls Track my location, I am traveling by a cab");
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: StreamBuilder(
              stream: DatabaseService(uid: user.uid)
                  .usersCollection
                  .doc(user.uid)
                  .snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  final_user_doc = snapshot;
                  return snapshot.data['register']
                      ? ListView(
                          children: [
                            Container(
                              width: size.width / 3,
                              height: size.width / 3,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                      snapshot.data['profile_pic'],
                                      scale: .5),
                                ),
                              ),
                            ),
                            //  CircleAvatar(
                            //   radius: size.width / 4,
                            //   backgroundImage: CachedNetworkImageProvider(

                            //     snapshot.data['profile_pic'],
                            //     maxWidth: (size.width / 4).round(),
                            //     scale: .3

                            //   ),
                            // ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Name: " + snapshot.data['name'],
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "License Number :" +
                                  snapshot.data['licenseNumber'],
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Car Number :" + snapshot.data['carNumber'],
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Home Address :" + snapshot.data['homeAddress'],
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Emergency Contact 1 :" +
                                  snapshot.data['emergencyContact1Name'] +
                                  " " +
                                  snapshot.data['emergencyContact1'],
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // Text(
                            //   snapshot.data['emergencyContact1'],
                            //   style: const TextStyle(
                            //       fontSize: 20, fontWeight: FontWeight.bold),
                            // ),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                          ],
                        )
                      : TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()),
                            );
                          },
                          child: Text('Complete Registeration'));
                }
                return const CircularProgressIndicator();
              }),
        ));
  }
}
