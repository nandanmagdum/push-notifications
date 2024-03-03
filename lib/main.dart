import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:push_notifications/firebase_options.dart';
import 'package:push_notifications/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:push_notifications/messaging.dart';
import 'package:push_notifications/notification_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // onBackground notification tapped ---
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    if (message.notification != null) {
      print("Background Notification Tapped !!!! ");
      Get.to(NotificationScreen(
        message: message,
      ));
    }
  });

  await FirebasePushNotifications.init();
  print("Firebase connected !");
  // listen to background message
  FirebaseMessaging.onBackgroundMessage(
      FirebasePushNotifications.firebaseBackgroundMessage);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
