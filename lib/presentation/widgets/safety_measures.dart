import 'package:flutter/material.dart';
import '../../data/models/info_item_model.dart';
import '../../data/repositories/home_repository.dart';
import 'section_title.dart';

class SafetyMeasuresSection extends StatelessWidget {
  const SafetyMeasuresSection({super.key});

  @override
  Widget build(BuildContext context) {
    const repo = HomeRepository();
    final items = repo.getSafetyMeasures();

    return Container(
      color: const Color(0xFFF6F7F9),
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'Best-in Class Safety Measures'),
          SafetyTileList(items: items),
        ],
      ),
    );
  }
}

class SafetyTileList extends StatelessWidget {
  final List<InfoItemModel> items;

  const SafetyTileList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items
          .map((e) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(

        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(e.icon, height: 70),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(e.title,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 4),
                  if (e.subtitle.isNotEmpty)
                    Text(
                      e.subtitle,
                      style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                    ),
                ],
              ),
            )
          ],
        ),
      ))
          .toList(),
    );
  }
}

