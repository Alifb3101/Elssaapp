import 'package:flutter/material.dart';
import '../../data/repositories/auth_repository.dart';
import '../widgets/custom_button.dart';
import '../widgets/otp_input_field.dart';
import 'home_page.dart';

class OtpPage extends StatefulWidget {
  final String phone;
  const OtpPage({super.key, required this.phone});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final repo = AuthRepository();
  String otp = "";

  void _verify() async {
    final success = await repo.verifyOtp(otp);
    if (success) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
            (route) => false,
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Invalid OTP")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton(color: Colors.black), backgroundColor: Colors.white, elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text("OTP Verification", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text("Enter the OTP sent to ${widget.phone}", style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 20),
            OtpInputField(onChanged: (val) => otp = val),
            const SizedBox(height: 20),
            CustomButton(text: "VERIFY & PROCEED", onPressed: _verify),
          ],
        ),
      ),
    );
  }
}
