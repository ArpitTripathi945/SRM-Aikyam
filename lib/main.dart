import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:srmthon/provider/item_provider.dart';
import 'package:srmthon/provider/review_cart_provider.dart';
import 'package:srmthon/routes.dart';
import 'package:srmthon/screens/home_view.dart';
import 'package:srmthon/screens/login_view.dart';
import 'package:srmthon/screens/medical_view.dart';
import 'package:srmthon/screens/splash_view.dart';
import 'firebase_options.dart';
import 'notificationservice/local_notification_service.dart';
import 'package:provider/provider.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationService.initialize();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "SRMthon",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ItemProvider>(
          create: (context) => ItemProvider(),
        ),
        ChangeNotifierProvider<ReviewCartProvider>(
          create: (context) => ReviewCartProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text('Something went wrong!'));
              }

              //display application
              if (snapshot.connectionState == ConnectionState.done) {
                final User? user = FirebaseAuth.instance.currentUser;
                if (user != null) {
                  return const HomeView();
                } else {
                  return const LoginView();
                }
              }
              return SplashView();
            },
          ),
        ),
        routes: {
          MyRoutes.loginviewRoute: (context) => LoginView(),
          MyRoutes.medicalviewRoute: (context) => MedicalView(),
        },
      ),
    );
  }
}
