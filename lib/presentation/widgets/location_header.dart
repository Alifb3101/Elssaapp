import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationHeader extends StatelessWidget {
  const LocationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
      child: Row(
        children: [
          Image.asset('assets/svg/location.png', height: 20),
          const SizedBox(width: 6),
          const Text('Home', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(width: 6),
          Image.asset('assets/svg/chevron_down.png', height: 14),
          const Spacer(),
          Image.asset('assets/svg/search.png', height: 20),
        ],
      ),
    );
  }
}
