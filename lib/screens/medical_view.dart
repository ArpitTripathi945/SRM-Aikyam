import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srmthon/global.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MedicalView extends StatefulWidget {
  const MedicalView({super.key});

  @override
  State<MedicalView> createState() => _MedicalViewState();
}

class _MedicalViewState extends State<MedicalView> {
  final Uri callLaunchUri = Uri(
    scheme: 'tel',
    path: '9999961317',
  );
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 12, 77, 162),
          title: Text("Medical Contacts"),
        ),
        backgroundColor: Color.fromARGB(255, 195, 201, 215),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                elevation: 10.0,
                shadowColor: Colors.blueAccent,
                clipBehavior: Clip.antiAlias,
                child: ListTile(
                  leading: Icon(Icons.local_hospital_rounded),
                  title: Text(
                    "Doctor",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(Icons.call_rounded),
                  tileColor: whitecolor,
                  onTap: () {
                    _callLaunchUri();
                  },
                ),
              ),
            ),
          ],
        ),
      );

  Future<void> _callLaunchUri() async {
    if (!await launchUrl(callLaunchUri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $callLaunchUri'.toString;
    }
  }
}
