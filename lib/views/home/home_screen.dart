import 'package:e_learning_app/sevices/dummy_data_service.dart';
import 'package:e_learning_app/views/home/widgets/category_section.dart';
import 'package:e_learning_app/views/home/widgets/how_app_bar.dart';
import 'package:e_learning_app/views/home/widgets/in_progress_section.dart';
import 'package:e_learning_app/views/home/widgets/recommended_section.dart';
import 'package:e_learning_app/views/home/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:e_learning_app/models/category.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Category> categories = [
    Category(
      id: '1',
      name: 'Programming',
      icon: Icons.code,
      courseCount: DummyDataService.getCoursesByCategory('1').length,
    ), //DummyDataService.
    Category(
      id: '2',
      name: 'Design',
      icon: Icons.brush,
      courseCount: DummyDataService.getCoursesByCategory('2').length,
    ), //DummyDataService.
    Category(
      id: '3',
      name: 'Bussiness',
      icon: Icons.business,
      courseCount: DummyDataService.getCoursesByCategory('3').length,
    ), //DummyDataService.
    Category(
      id: '4',
      name: 'Music',
      icon: Icons.music_note,
      courseCount: DummyDataService.getCoursesByCategory('4').length,
    ),
    Category(
      id: '5',
      name: 'Photography',
      icon: Icons.camera_alt,
      courseCount: DummyDataService.getCoursesByCategory('5').length,
    ), //DummyDataService.
    Category(
      id: '6',
      name: 'Language',
      icon: Icons.language,
      courseCount: DummyDataService.getCoursesByCategory('6').length,
    ),
    Category(
      id: '7',
      name: 'Health & Fitness',
      icon: Icons.fitness_center,
      courseCount: DummyDataService.getCoursesByCategory('7').length,
    ), //DummyDataService.
    Category(
      id: '8',
      name: 'Personal Development',
      icon: Icons.psychology,
      courseCount: DummyDataService.getCoursesByCategory('8').length,
    ), //DummyDataService //DummyDataService
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        HowAppBar(),
        SliverPadding(
          padding: EdgeInsets.all(20),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              const SearchBarWidget(),
              const SizedBox(height: 32),
              CategorySection(categories: categories),
              const SizedBox(height: 32),
              InProgressSection(),
              RecommendedSection(),
            ]),
          ),
        ),
      ],
    );
  }
}
