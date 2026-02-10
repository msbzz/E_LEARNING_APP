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
    );
  }
}
