import 'package:flutter/material.dart';
import 'package:fake_store_app/features/home/presentation/widgets/header_widget.dart';
import 'package:fake_store_app/features/home/presentation/widgets/product_cards_section.dart';

class SectionWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const SectionWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          HeaderWidget(title: title, subTitle: subtitle),
          const SizedBox(height: 10),
          const ProductCardsSection(),
        ],
      ),
    );
  }
}
