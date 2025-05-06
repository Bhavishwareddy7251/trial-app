import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'otp_screen.dart'; // We'll create this next

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // ✅ Initializes Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OTP Auth Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PhoneInputScreen(),
    );
  }
}
