import 'package:elssa_assignment/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import '../../data/repositories/auth_repository.dart';
import '../widgets/custom_button.dart';
import '../widgets/phone_input_field.dart';
import 'otp_page.dart';
import 'old_login_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final phoneController = TextEditingController();
  final repo = AuthRepository();

  void _sendOtp() async {
    final success = await repo.sendOtp(phoneController.text);
    if (success) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => OtpPage(phone: phoneController.text)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/svg/Frame.png'),
            const Text("Your Home services Expert",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(20),
              child: PhoneInputField(controller: phoneController),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(text: "SIGN UP", onPressed: _sendOtp),
            ),
            TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
            }, child: Text("View Other Options(for direct home page)" , style: TextStyle(color: Colors.blue),)),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const OldLoginPage()),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   const Text("ALREADY HAVE AN ACCOUNT? ",
                      style: TextStyle(fontSize: 14, color: Colors.black54)),
                     InkWell(
                       onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => OldLoginPage())),
                       child: const Text("LOG IN",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          )),
                     ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
