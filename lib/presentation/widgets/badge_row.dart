import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../data/models/info_item_model.dart';

class BadgeRow extends StatelessWidget {
  final List<InfoItemModel> badges;

  const BadgeRow({super.key, required this.badges});

  @override
  Widget build(BuildContext context) {
    if (badges.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(top: 6, bottom: 6),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: badges
              .map((b) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: const Color(0xFFF2F4F7),
                  child: SvgPicture.asset(b.icon,fit: BoxFit.fill,),
                ),
                const SizedBox(height: 6),
                SizedBox(
                  width: 72,
                  child: Text(
                    b.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 10),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ))
              .toList(),
        ),
      ),
    );
  }
}
