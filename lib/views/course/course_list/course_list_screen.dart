import 'package:e_learning_app/core/theme/app_colors.dart';
import 'package:e_learning_app/sevices/dummy_data_service.dart';
import 'package:e_learning_app/views/course/course_list/widgets/course_filter_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class CourseListScreen extends StatelessWidget {
  final String? categoryId;
  final String? categoryName;
  final bool showBackButton;

  const CourseListScreen({
    super.key,
    this.categoryId,
    this.categoryName,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final courses = categoryId != null
        ? DummyDataService.getCoursesByCategory(categoryId!)
        : DummyDataService.courses;

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: AppColors.primary,
            automaticallyImplyLeading: categoryId != null || showBackButton,
            leading: (categoryId != null || showBackButton)
                ? IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back),
                  )
                : null,
            actions: [
              IconButton(
                onPressed: () => _showFilterDialog(context),
                icon: Icon(Icons.filter_list, color: AppColors.accent),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.all(6),
              title: Text(
                categoryName ?? 'All Courses',
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: AppColors.accent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => CourseFilterDialog(),
    );
  }
}
