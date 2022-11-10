import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srmthon/spinner.dart';

class MessView extends StatefulWidget {
  const MessView({super.key});

  @override
  State<MessView> createState() => _MessViewState();
}

class _MessViewState extends State<MessView> {
  User? user = FirebaseAuth.instance.currentUser;
  final CollectionReference ref =
      FirebaseFirestore.instance.collection('messmenu');
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 12, 77, 162),
            title: Text("SRM - Mess"),
          ),
          drawer: Drawer(),
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
}
