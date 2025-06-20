import 'package:fake_store_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarouselItem {
  final String imageUrl;
  final String title;

  CarouselItem({
    required this.imageUrl,
    required this.title,
  });
}

class CarouselSliderCard extends StatelessWidget {
  final CarouselItem item;
  final VoidCallback onTap;

  const CarouselSliderCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(item.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 16,
              bottom: 16,
              child: Text(
                item.title,
                style: GoogleFonts.tiroBangla(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: AppColors.ordinaryText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
