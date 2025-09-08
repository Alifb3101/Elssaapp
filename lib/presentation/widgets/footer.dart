import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 22),
      child: Center(
        child: Text(
          'HASSLE FREE\nQUALITY SERVICE\nV 1.0',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xFF9CA3AF), height: 1.4),
        ),
      ),
    );
  }
}
