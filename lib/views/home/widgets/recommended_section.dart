import 'package:e_learning_app/sevices/dummy_data_service.dart';
import 'package:flutter/material.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final couser = DummyDataService.courses;

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
      ],
    );
  }
}
