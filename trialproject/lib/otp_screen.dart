import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({super.key, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _verifyOtp() async {
    String otp = _otpController.text.trim();

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationId,
      smsCode: otp,
    );

    try {
      await _auth.signInWithCredential(credential);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Phone number verified!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid OTP')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Enter OTP")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "OTP",
                hintText: "123456",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _verifyOtp,
              child: const Text("Verify OTP"),
            ),
          ],
        ),
      ),
    );
  }
}
