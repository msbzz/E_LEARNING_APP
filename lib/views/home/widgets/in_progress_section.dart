import 'package:e_learning_app/sevices/dummy_data_service.dart';
import 'package:flutter/material.dart';

class InProgressSection extends StatelessWidget {
  const InProgressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final inProgressCourses = DummyDataService.courses
        .where(
          (course) =>
              course.lessons.any((lesson) => lesson.isCompleted) &&
              !course.lessons.every((lesson) => lesson.isCompleted),
        )
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'In Progress',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
