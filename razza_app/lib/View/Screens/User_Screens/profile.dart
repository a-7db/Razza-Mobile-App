import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razza_app/Model/auth.dart';
import 'package:razza_app/Model/firestore.dart';
import 'package:razza_app/View/Screens/User_Screens/history.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Auth auth = Auth();
  DB db = DB();

  var user = FirebaseAuth.instance.currentUser;
  String? image = null, name = null, email = null;

  var filename;
  changePhoto() {
    if (db.file != null) {
      setState(() {
        filename = db.file;
      });
    }
  }

  CollectionReference ref = FirebaseFirestore.instance.collection('users');

  showProfile() async {
    await ref
        .where('UID', isEqualTo: user!.uid)
        .get()
        .then((value) => value.docs.forEach((element) {
              setState(() {
                email = element['email'];
                name = element['name'];
                image = element['Avatar'];
              });
            }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      showProfile();
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        Container(
          color: Colors.white,
          height: 250,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              FadeIn(
                child: Text(
                  'My Profile',
                  style: GoogleFonts.poppins(fontSize: 20),
                ),
              ),
              SizedBox(height: 25),
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomRight,
                children: [
                  FadeIn(
                    delay: Duration(milliseconds: 300),
                    child: Container(
                      height: 80,
                      width: 80,
                      child: image != null
                          ? CircleAvatar(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image(
                                    image: NetworkImage(image ?? ''),
                                    fit: BoxFit.cover,
                                    width: 80,
                                    height: 80,
                                  )))
                          : Center(
                              child: Icon(
                                Icons.person_rounded,
                                color: Colors.grey,
                                size: 50,
                              ),
                            ),
                      decoration: BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                  Positioned(
                    bottom: -8,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 115,
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      db.imageUser(true);
                                      Navigator.pop(context);
                                      changePhoto();
                                    },
                                    child: ListTile(
                                      title: Text('Gallery'),
                                      leading: Icon(Icons.photo_library),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      db.imageUser(false);
                                      Navigator.pop(context);
                                      changePhoto();
                                    },
                                    child: ListTile(
                                      title: Text('Camera'),
                                      leading: Icon(Icons.camera_alt_rounded),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        width: 35,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 87, 43, 133),
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.white,
                                width: 2,
                                strokeAlign: StrokeAlign.outside)),
                        child: Padding(
                          padding: const EdgeInsets.all(7),
                          child: Icon(Icons.camera_alt_rounded,
                              color: Colors.white, size: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Container(
                  width: double.infinity,
                  height: 55,
                  child: Column(
                    children: [
                      name != null
                          ? FadeIn(child: Text(name ?? ''), delay: Duration(milliseconds: 1000),
                            )
                          : Text(
                              "name",
                              style: GoogleFonts.flowCircular(
                                  color: Colors.grey[200]),
                            ),
                      SizedBox(height: 15),
                      email != null
                          ? FadeIn(child: Text(email ?? ''),
                              delay: Duration(milliseconds: 1000),
                            )
                          : Text(
                              "Example@email.com",
                              style: GoogleFonts.flowCircular(
                                  color: Colors.grey[200]),
                            ),
                    ],
                  )),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return HistoryScreen();
                    },
                  ));
                },
                child: ListTile(
                  leading: FadeInLeft(child: Icon(Icons.history, color: Colors.green),
                    delay: Duration(milliseconds: 1300),
                  ),
                  title: FadeInLeft(
                    delay: Duration(milliseconds: 900),
                    child: Text(
                      'History',
                      style: GoogleFonts.poppins(color: Colors.green),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  auth.logOut(context);
                },
                child: ListTile(
                  leading: FadeInLeft(child: Icon(Icons.logout, color: Colors.redAccent[100]),
                    delay: Duration(milliseconds: 1300),
                  ),
                  title: FadeInLeft(
                    delay: Duration(milliseconds: 1100),
                    child: Text('Logout',
                        style: GoogleFonts.poppins(color: Colors.redAccent[100])),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
