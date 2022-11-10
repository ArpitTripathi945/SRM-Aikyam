import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srmthon/models/user_model.dart';
import 'package:srmthon/routes.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel currentuser = UserModel();
  final CollectionReference ref =
      FirebaseFirestore.instance.collection('users');

  @override
  void initState() {
    super.initState();
    ref.doc(user!.uid).get().then((value) {
      this.currentuser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromARGB(255, 171, 174, 190),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 30),
        child: Container(
            child: Column(children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            IconButton(
                icon: Icon(Icons.logout_outlined),
                color: Color.fromARGB(255, 54, 55, 62),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushNamed(context, MyRoutes.loginviewRoute);
                }),
          ]),
          Text(
            'Profile',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: GoogleFonts.lobster().fontFamily,
              fontSize: 50.0,
              color: Color.fromARGB(255, 54, 55, 62),
            ),
          ),
          SizedBox(height: 30),
          CircleAvatar(
            maxRadius: 60.0,
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            child:
                Image.asset('assets/srmseal.png', alignment: Alignment.center),
          ),
          SizedBox(height: 50),
          Text('Fullname',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                  fontWeight: FontWeight.w500)),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 10.0,
            shadowColor: Colors.blueAccent,
            clipBehavior: Clip.antiAlias,
            child: ListTile(
                tileColor: Color.fromARGB(255, 255, 255, 255),
                title: Text(
                  '${currentuser.name}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
          ),
          SizedBox(height: 10),
          Text('Reg No.',
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                  fontWeight: FontWeight.w500)),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 10.0,
            shadowColor: Colors.blueAccent,
            clipBehavior: Clip.antiAlias,
            child: ListTile(
                tileColor: Color.fromARGB(255, 255, 255, 255),
                title: Text(
                  '${currentuser.regno}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
          ),
          SizedBox(height: 10),
          Text('Email',
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                  fontWeight: FontWeight.w500)),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 10.0,
            shadowColor: Colors.blueAccent,
            clipBehavior: Clip.antiAlias,
            child: ListTile(
                tileColor: Color.fromARGB(255, 255, 255, 255),
                title: Text(
                  '${currentuser.email}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
          ),
          SizedBox(height: 10),
          Text('Block & Room',
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                  fontWeight: FontWeight.w500)),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 10.0,
            shadowColor: Colors.blueAccent,
            clipBehavior: Clip.antiAlias,
            child: ListTile(
                tileColor: Color.fromARGB(255, 255, 255, 255),
                title: Text(
                  '${currentuser.block}' '-' + '${currentuser.roomno}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
          ),
        ])),
      ),
    );
  }
}
