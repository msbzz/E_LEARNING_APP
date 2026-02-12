import 'package:e_learning_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class EpmtyStateWidget extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onActionPressed;
  final String actionLabel;
  final IconData icon;

  const EpmtyStateWidget({
    super.key,
    this.title = 'No Courses Found',
    this.message = 'There are Courses available in this category yet',
    this.onActionPressed,
    this.actionLabel = 'Go Back',
    this.icon = Icons.school_outlined,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 80, color: AppColors.primary.withValues(alpha: 0.1)),
          const SizedBox(height: 16),
          Text(
            title,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: AppColors.secondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
