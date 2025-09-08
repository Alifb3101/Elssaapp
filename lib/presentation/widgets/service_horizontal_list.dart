import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../data/models/service_model.dart';

class ServiceHorizontalList extends StatelessWidget {
  final List<ServiceModel> services;
  final double tileSize;

  const ServiceHorizontalList({
    super.key,
    required this.services,
    this.tileSize = 100,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: tileSize + 40,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        itemCount: services.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final s = services[index];
          return _ServiceTile(icon: s.icon, label: s.label, size: tileSize);
        },
      ),
    );
  }
}

class _ServiceTile extends StatelessWidget {
  final String icon;
  final String label;
  final double size;

  const _ServiceTile({
    required this.icon,
    required this.label,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: size,
          width: size + 50,
          decoration: BoxDecoration(
            color: const Color(0xFFF2F4F7),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.asset(icon , fit: BoxFit.fill,),
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: size,
          child: Text(
            label,
            style: const TextStyle(fontSize: 12),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
