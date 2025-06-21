import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final double rating;
  final int maxRating;
  final double size;
  final Function(double)? onRatingChanged;
  final bool isInteractive;

  const RatingWidget({
    super.key,
    required this.rating,
    this.maxRating = 5,
    this.size = 16,
    this.onRatingChanged,
    this.isInteractive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(maxRating, (index) {
        return GestureDetector(
          onTap: isInteractive
              ? () => onRatingChanged?.call((index + 1).toDouble())
              : null,
          child: Icon(
            index < rating.floor()
                ? Icons.star
                : index < rating
                    ? Icons.star_half
                    : Icons.star_border,
            color: Colors.orange,
            size: size,
          ),
        );
      }),
    );
  }
}