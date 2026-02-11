import 'package:e_learning_app/sevices/dummy_data_service.dart';
import 'package:e_learning_app/views/home/widgets/recommended_course_card.dart';
import 'package:flutter/material.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final courses = DummyDataService.courses;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recommende',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(onPressed: () {}, child: Text('See All')),
          ],
        ),
        SizedBox(
          height: 200,
          child: courses.isEmpty
              ? const Center(child: Text('Sem recomendações no momento'))
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    final course = courses[index];
                    debugPrint(
                      '==== course.lessons.length ==== ${course.lessons.length}',
                    );
                    return RecommendedCourseCard(
                      courseId: course.id,
                      title: course.title,
                      imageUrl: course.imageUrl,
                      duration: '${course.lessons.length * 30} mins',
                      isPremium: course.isPremium,
                    );
                  },
                ),
        ),
      ],
    );
  }
}
