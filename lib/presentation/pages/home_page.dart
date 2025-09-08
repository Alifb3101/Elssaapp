import 'package:flutter/material.dart';
import '../../data/repositories/home_repository.dart';
import '../widgets/location_header.dart';
import '../widgets/banner_section.dart';
import '../widgets/category_grid.dart';
import '../widgets/section_title.dart';
import '../widgets/service_horizontal_list.dart';
import '../widgets/badge_row.dart';
import '../widgets/info_tile_list.dart';
import '../widgets/safety_measures.dart';
import '../widgets/footer.dart';
import '../widgets/bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const repo = HomeRepository();

    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LocationHeader(),
              const BannerSection(),
              CategoryGrid(categories: repo.getCategories()),
              const SectionTitle(title: 'Popular Services'),
              ServiceHorizontalList(services: repo.getPopularServices(), tileSize: 83),
              const SectionTitle(title: 'Cleaning Services'),
              ServiceHorizontalList(services: repo.getCleaningServices(), tileSize: 83),
              BadgeRow(badges: repo.getBadges()),
              const SectionTitle(title: 'Why Choose Us'),
              InfoTileList(items: repo.getWhyChooseUs()),
              const SafetyMeasuresSection(),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
