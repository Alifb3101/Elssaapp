import 'package:flutter/material.dart';

class PhoneInputField extends StatefulWidget {
  final TextEditingController controller;

  const PhoneInputField({super.key, required this.controller});

  @override
  State<PhoneInputField> createState() => _PhoneInputFieldState();
}

class _PhoneInputFieldState extends State<PhoneInputField> {
  String selectedCode = "+91"; // default India
  final List<String> codes = ["+91", "+1", "+44", "+61"];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Row(
        children: [
          /// Flag (static for now, could extend to dynamic later)
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              "assets/svg/flag.png",
              width: 28,
              height: 20,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),

          /// Dropdown for country code
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedCode,
              items: codes
                  .map((code) => DropdownMenuItem(
                value: code,
                child: Text(
                  code,
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
              ))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() => selectedCode = value);
                }
              },
            ),
          ),
          const SizedBox(width: 8),

          /// Divider
          Container(width: 1, height: 30, color: Colors.grey.shade400),

          const SizedBox(width: 8),

          /// Phone input field
          Expanded(
            child: TextField(
              controller: widget.controller,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Enter phone number",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
