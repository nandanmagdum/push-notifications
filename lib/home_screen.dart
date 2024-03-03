import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_notifications/notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(NotificationScreen());
        },
        child: Icon(Icons.notifications),
      ),
      appBar: AppBar(
        title: Text("HomeScreen"),
      ),
      body: Center(
        child: Text("Home Screen"),
      ),
    );
  }
}
