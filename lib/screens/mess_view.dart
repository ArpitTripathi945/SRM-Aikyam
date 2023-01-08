import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srmthon/models/user_model.dart';
import 'package:srmthon/routes.dart';
import 'package:srmthon/screens/profile_view.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:srmthon/spinner.dart';
import 'package:url_launcher/url_launcher.dart';

dynamic color = Color.fromARGB(255, 48, 255, 1);

class MessView extends StatefulWidget {
  const MessView({super.key});

  @override
  State<MessView> createState() => _MessViewState();
}

class _MessViewState extends State<MessView> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel currentuser = UserModel();
  final CollectionReference ref =
      FirebaseFirestore.instance.collection('messmenu');
  final CollectionReference userref =
      FirebaseFirestore.instance.collection('users');
  final _realtimedatabase = FirebaseDatabase.instance.refFromURL(
      "https://srmthon-default-rtdb.asia-southeast1.firebasedatabase.app");
  final Uri _evarsity = Uri.parse('https://evarsity.srmist.edu.in/srmsip/');
  final Uri _pass = Uri.parse('https://www.srmimthostel.net/olms/');
  final Uri _grievances = Uri.parse('http://srmupmaintenance.in/maintenance');

  @override
  void initState() {
    super.initState();
    _activateListner();
    userref.doc(user!.uid).get().then((value) {
      this.currentuser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  _activateListner() {
    _realtimedatabase.child('objectcount/count').onValue.listen((event) {
      final dynamic noOfPeople = event.snapshot.value;
      setState(() {
        if (noOfPeople as int > 3) {
          setState(() {
            color = Color.fromARGB(255, 255, 0, 0);
          });
        } else {
          setState(() {
            color = Color.fromARGB(255, 48, 255, 1);
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 12, 77, 162),
            title: Text("SRM - Mess"),
            actions: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CircleAvatar(
                  backgroundColor: color,
                  radius: 10,
                ),
              )
            ],
          ),
          drawer: Drawer(
            backgroundColor: Color.fromARGB(255, 195, 201, 215),
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 12, 77, 162),
                  ),
                  accountName: Text('${currentuser.name}'),
                  accountEmail: Text(
                      '${currentuser.block}' '-' + '${currentuser.roomno}'),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 59.0,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      maxRadius: 55.0,
                      child: CircleAvatar(
                        maxRadius: 50.0,
                        backgroundColor: Color.fromARGB(255, 195, 201, 215),
                        child: Icon(
                          Icons.person,
                          size: 70.0,
                          color: Color.fromARGB(255, 15, 17, 32),
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Text("Evarsity"),
                  trailing: Icon(Icons.open_in_browser_rounded),
                  onTap: () {
                    _launchEvarsity();
                  },
                ),
                Divider(
                  thickness: 0.5,
                ),
                ListTile(
                  title: Text("Leave/Out Pass"),
                  trailing: Icon(Icons.time_to_leave_rounded),
                  onTap: () {
                    _launchPass();
                  },
                ),
                Divider(
                  thickness: 0.5,
                ),
                ListTile(
                  title: Text("Grievances"),
                  trailing: Icon(Icons.task_rounded),
                  onTap: () {
                    _launchGrievances();
                  },
                ),
                Divider(
                  thickness: 0.5,
                ),
                ListTile(
                    title: Text("Emergancy Contacts"),
                    trailing: Icon(Icons.local_hospital_rounded),
                    onTap: (() {
                      Navigator.pushNamed(context, MyRoutes.medicalviewRoute);
                    })),
                Divider(
                  thickness: 0.5,
                ),
                ListTile(
                  title: Text("My Orders"),
                  trailing: Icon(Icons.list_rounded),
                  onTap: () {},
                ),
                Divider(
                  thickness: 0.5,
                ),
              ],
            ),
          ),
          backgroundColor: Color.fromARGB(255, 195, 201, 215),
          body: Column(children: [
            SizedBox(
              height: 5,
            ),
            Expanded(
                child: StreamBuilder<QuerySnapshot>(
                    stream: ref.orderBy("index", descending: false).snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      //checking the connection state, if we still load the data we display a spinner
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Spinner();
                      }
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemBuilder: (context, index) {
                            final DocumentSnapshot documentSnapshot =
                                snapshot.data!.docs[index];
                            final String weekday = snapshot
                                .data!.docs[index].reference.id
                                .toString();

                            return Padding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                elevation: 10.0,
                                shadowColor: Colors.blueAccent,
                                clipBehavior: Clip.antiAlias,
                                child: ExpansionTile(
                                  title: Text(
                                    weekday,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily:
                                            GoogleFonts.inter().fontFamily,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  leading: Icon(Icons.food_bank_rounded),
                                  backgroundColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  children: [
                                    ListTile(
                                      title: Text(
                                        "Breakfast -> " +
                                            documentSnapshot["breakfast"],
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily:
                                                GoogleFonts.inter().fontFamily,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    ListTile(
                                      title: Text(
                                        "Lunch -> " + documentSnapshot["lunch"],
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily:
                                                GoogleFonts.inter().fontFamily,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    ListTile(
                                      title: Text(
                                        "Snacks -> " +
                                            documentSnapshot["snacks"],
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily:
                                                GoogleFonts.inter().fontFamily,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    ListTile(
                                      title: Text(
                                        "Dinner -> " +
                                            documentSnapshot["dinner"],
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily:
                                                GoogleFonts.inter().fontFamily,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: snapshot.data!.docs.length,
                        );
                      }
                      return Text("Please Wait",
                          style: GoogleFonts.inter(
                              color: Colors.white,
                              fontWeight: FontWeight.bold));
                    }))
          ])),
    );
  }

  Future<void> _launchEvarsity() async {
    if (!await launchUrl(_evarsity, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $_evarsity';
    }
  }

  Future<void> _launchPass() async {
    if (!await launchUrl(_pass, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $_pass';
    }
  }

  Future<void> _launchGrievances() async {
    if (!await launchUrl(_grievances, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $_grievances';
    }
  }
}
