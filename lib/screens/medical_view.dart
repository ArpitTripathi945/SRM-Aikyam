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
  final Uri deancl = Uri(
    scheme: 'tel',
    path: '9891292966',
  );
  final Uri hdoctor = Uri(
    scheme: 'tel',
    path: '8077481879',
  );
  final Uri gdoctor = Uri(
    scheme: 'tel',
    path: '8077481879',
  );
  final Uri hblockwarden = Uri(
    scheme: 'tel',
    path: '8006520356',
  );
  final Uri cfblockwarden = Uri(
    scheme: 'tel',
    path: '9319758227',
  );
  final Uri gblockwarden = Uri(
    scheme: 'tel',
    path: '8923765238',
  );
  final Uri dblockwarden = Uri(
    scheme: 'tel',
    path: '9899437024',
  );
  final Uri eblockwarden = Uri(
    scheme: 'tel',
    path: '8859680642',
  );
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 12, 77, 162),
          title: Text("Emergency Contacts"),
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
                    "Dean Campus Life",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(Icons.call_rounded),
                  tileColor: whitecolor,
                  onTap: () {
                    _deancl();
                  },
                ),
              ),
            ),
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
                    "H block Doctor",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(Icons.call_rounded),
                  tileColor: whitecolor,
                  onTap: () {
                    _hdoctor();
                  },
                ),
              ),
            ),
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
                    "G block Doctor",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(Icons.call_rounded),
                  tileColor: whitecolor,
                  onTap: () {
                    _gdoctor();
                  },
                ),
              ),
            ),
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
                    "H block Warden",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(Icons.call_rounded),
                  tileColor: whitecolor,
                  onTap: () {
                    _hblockwarden();
                  },
                ),
              ),
            ),
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
                    "C & F block Warden",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(Icons.call_rounded),
                  tileColor: whitecolor,
                  onTap: () {
                    _cfblockwarden();
                  },
                ),
              ),
            ),
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
                    "G block Warden",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(Icons.call_rounded),
                  tileColor: whitecolor,
                  onTap: () {
                    _gblockwarden();
                  },
                ),
              ),
            ),
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
                    "D block Warden",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(Icons.call_rounded),
                  tileColor: whitecolor,
                  onTap: () {
                    _dblockwarden();
                  },
                ),
              ),
            ),
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
                    "E block Warden",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(Icons.call_rounded),
                  tileColor: whitecolor,
                  onTap: () {
                    _eblockwarden();
                  },
                ),
              ),
            ),
          ],
        ),
      );

  Future<void> _deancl() async {
    if (!await launchUrl(deancl, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $deancl'.toString;
    }
  }

  Future<void> _hdoctor() async {
    if (!await launchUrl(hdoctor, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $hdoctor'.toString;
    }
  }

  Future<void> _gdoctor() async {
    if (!await launchUrl(gdoctor, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $gdoctor'.toString;
    }
  }

  Future<void> _hblockwarden() async {
    if (!await launchUrl(hblockwarden, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $hblockwarden'.toString;
    }
  }

  Future<void> _cfblockwarden() async {
    if (!await launchUrl(cfblockwarden, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $cfblockwarden'.toString;
    }
  }

  Future<void> _gblockwarden() async {
    if (!await launchUrl(gblockwarden, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $gblockwarden'.toString;
    }
  }

  Future<void> _dblockwarden() async {
    if (!await launchUrl(dblockwarden, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $dblockwarden'.toString;
    }
  }

  Future<void> _eblockwarden() async {
    if (!await launchUrl(eblockwarden, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $eblockwarden'.toString;
    }
  }
}
