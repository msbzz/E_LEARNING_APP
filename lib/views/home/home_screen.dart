import 'package:e_learning_app/views/home/widgets/how_app_bar.dart';
import 'package:e_learning_app/views/home/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        HowAppBar(),
        SliverPadding(
          padding: EdgeInsets.all(20),
          sliver: SliverList(
            delegate: SliverChildListDelegate([const SearchBarWidget()]),
          ),
        ),
      ],
    );
  }
}
