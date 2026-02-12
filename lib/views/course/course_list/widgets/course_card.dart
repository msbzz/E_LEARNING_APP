import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_learning_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String courseId;
  final String title;
  final String subtiltle;
  final String imageUrl;
  final double rating;
  final String duration;
  final bool isPremium;

  const CourseCard({
    super.key,
    required this.courseId,
    required this.title,
    required this.subtiltle,
    required this.imageUrl,
    required this.rating,
    required this.duration,
    this.isPremium = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
