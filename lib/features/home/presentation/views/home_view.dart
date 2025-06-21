import 'package:fake_store_app/core/widgets/custom_navigation_bar.dart';
import 'package:fake_store_app/features/home/presentation/widgets/custom_carousel_slider.dart';
import 'package:fake_store_app/features/home/presentation/widgets/section_widget.dart';
import 'package:flutter/material.dart';
import 'package:fake_store_app/core/constant/app_colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: CustomCarouselSlider()),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
           SliverToBoxAdapter(
            child: SectionWidget(
              title: 'Sale',
              subtitle: 'Super summer sale',
            ),
          ),
           SliverToBoxAdapter(
            child: SectionWidget(
              title: 'New',
              subtitle: 'You\'ve never seen it before!',
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(selectedIndex: 0),
    );
  }
}
