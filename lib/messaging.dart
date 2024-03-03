import 'package:firebase_messaging/firebase_messaging.dart';

class FirebasePushNotifications {
  static final _firebaseMessaging = FirebaseMessaging.instance;

  // request notification permission
  static Future init() async {
    await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: false,
        criticalAlert: true,
        provisional: false,
        sound: true);

    // get the device fcm token
    final token = await _firebaseMessaging.getToken();
    print("Device FCM Token : ${token}");
  }

  // function to listen to background changes
  static Future<void> firebaseBackgroundMessage(RemoteMessage message) async {
    if (message.notification != null) {
      print("Some New notification Recieved from Firebase .... !!!!!");
    }
  }
}
