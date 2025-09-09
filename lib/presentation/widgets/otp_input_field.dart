import 'package:flutter/material.dart';

class OtpInputField extends StatelessWidget {
  final void Function(String) onChanged;
  const OtpInputField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: TextInputType.number,
      maxLength: 4,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 24, letterSpacing: 16),
      decoration: const InputDecoration(
        counterText: "",
        border: InputBorder.none,
      ),
    );
  }
}
