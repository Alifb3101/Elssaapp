import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  static const _items = [
    {'icon': 'assets/svg/home.png', 'label': 'Home'},
    {'icon': 'assets/svg/gift.png', 'label': 'Rewards'},
    {'icon': 'assets/svg/Purchase Order.png', 'label': 'My Orders'},
    {'icon': 'assets/svg/booking 1.png', 'label': 'Bookings'},
    {'icon': 'assets/svg/user.png', 'label': 'Profile'},
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      onTap: (_) {},
      items: _items
          .map(
            (e) => BottomNavigationBarItem(
          icon: Image.asset(e['icon']!, height: 22),
          label: e['label']!,
        ),
      )
          .toList(),
    );
  }
}
