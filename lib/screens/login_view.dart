import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srmthon/global.dart';

import 'home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: EdgeInsets.only(left: 35, top: 155),
              child: Text(
                'Welcome\nBack!',
                style: TextStyle(
                    color: whitecolor,
                    fontSize: 34,
                    fontFamily: GoogleFonts.inter().fontFamily),
              ),
            ),
            SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: emailController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ("Please Enter Your Email");
                                }
                                return null;
                              },
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 253, 253, 253),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                labelText: "Email",
                                labelStyle: const TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              textInputAction: TextInputAction.done,
                              controller: passwordController,
                              enableSuggestions: false,
                              autocorrect: false,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              obscureText: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 255, 255, 255),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                labelText: "Password",
                                labelStyle: const TextStyle(
                                    color: Color.fromARGB(255, 6, 6, 6),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                if (formkey.currentState!.validate()) {
                                  try {
                                    await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                            email: emailController.text,
                                            password: passwordController.text)
                                        .then((uid) => {
                                              Fluttertoast.showToast(
                                                  msg: "Login Successful"),
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              HomeView()))
                                            });
                                  } catch (e) {
                                    Fluttertoast.showToast(
                                        msg: "Enter Correct User Credentials");
                                  }
                                  ;
                                }
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(fontSize: 16),
                              ),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(360, 60),
                                primary: loginbuttoncolor,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 107, top: 725),
              child: Text(
                'Developed by Team SPECTRE',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.black,
                    fontSize: 11,
                    fontFamily: GoogleFonts.inter().fontFamily),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
