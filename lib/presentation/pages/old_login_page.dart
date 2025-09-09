import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../data/repositories/auth_repository.dart';
import '../widgets/custom_button.dart';
import '../widgets/phone_input_field.dart';
import 'login_page.dart';
import 'otp_page.dart';
import 'home_page.dart';

class OldLoginPage extends StatefulWidget {
  const OldLoginPage({super.key});

  @override
  State<OldLoginPage> createState() => _OldLoginPageState();
}

class _OldLoginPageState extends State<OldLoginPage> {
  final phoneController = TextEditingController();
  final repo = AuthRepository();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _login() async {
    final success = await repo.sendOtp(phoneController.text);
    if (success) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => OtpPage(phone: phoneController.text)),
      );
    }
  }


  Future<void> _googleLogin() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return; // cancelled

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

      User? user = userCredential.user;

      if (user != null) {
        debugPrint("✅ Logged in as: ${user.displayName}, ${user.email}");

        // Redirect to HomePage
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomePage()),
          );
        }
      }
    } catch (e, st) {
      debugPrint("Google Sign-In Error: $e");
      debugPrintStack(stackTrace: st);
    }
  }




  Future<void> _facebookLogin() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final OAuthCredential credential =
        FacebookAuthProvider.credential(result.accessToken!.token);

        await _auth.signInWithCredential(credential);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
        );
      } else {
        debugPrint("Facebook login failed: ${result.status}");
      }
    } catch (e) {
      debugPrint("Facebook Sign-In Error: $e");
    }
  }

  Widget _socialButton({
    required String text,
    required String icon,
    required Color bgColor,
    required Color textColor,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: BorderSide(color: bgColor == Colors.white ? Colors.grey : bgColor),
          ),
        ),
        icon: Image.asset(icon, height: 20, width: 20),
        label: Text(text, style: TextStyle(color: textColor, fontSize: 15)),
        onPressed: onPressed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              const Text(
                "Welcome Back!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              /// Facebook Button
              _socialButton(
                text: "CONTINUE WITH FACEBOOK",
                icon: "assets/svg/meta.png",
                bgColor: const Color(0xFF1877F2),
                textColor: Colors.white,
                onPressed: _facebookLogin,
              ),
              const SizedBox(height: 15),

              /// Google Button
              _socialButton(
                text: "CONTINUE WITH GOOGLE",
                icon: "assets/svg/google.png",
                bgColor: Colors.white,
                textColor: Colors.black,
                onPressed: _googleLogin,
              ),

              const SizedBox(height: 25),

              /// Divider with text
              Row(
                children: const [
                  Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "OR CONTINUE WITH PHONE NUMBER",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                  Expanded(child: Divider(thickness: 1)),
                ],
              ),

              const SizedBox(height: 20),

              /// Phone number input
              PhoneInputField(controller: phoneController),

              const SizedBox(height: 20),

              /// Login button
              CustomButton(text: "LOG IN", onPressed: _login),

              const SizedBox(height: 5),

              /// Forgot password
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              /// Bottom sign up text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "DON’T HAVE AN ACCOUNT?",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: const Text(
                      "SIGN UP",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
