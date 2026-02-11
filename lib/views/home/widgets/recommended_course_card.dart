import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_learning_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RecommendedCourseCard extends StatelessWidget {
  final String courseId;
  final String title;
  final String imageUrl;
  final String duration;
  final bool isPremium;

  const RecommendedCourseCard({
    super.key,
    required this.courseId,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.isPremium,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 16, bottom: 5),
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      height: 90,
                      width: 150,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: AppColors.primary.withValues(alpha: 0.1),
                        highlightColor: AppColors.accent,
                        child: Container(
                          height: 90,
                          width: 150,
                          color: Colors.white,
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        child: const Icon(Icons.error),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
