import 'package:e_learning_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HowAppBar extends StatelessWidget {
  const HowAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
      expandedHeight: 180,
      floating: false,
      pinned: true,
      backgroundColor: AppColors.primary,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.analytics, color: Colors.white),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back',
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.accent.withValues(alpha: 0.7),
              ),
            ),
            Text(
              'John Doe',
              style: theme.textTheme.titleLarge?.copyWith(
                color: AppColors.accent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
