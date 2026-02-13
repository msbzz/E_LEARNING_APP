import 'package:e_learning_app/core/theme/app_colors.dart';
import 'package:e_learning_app/views/profile/widgets/profile_app_bar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          ProfileAppBar(
            initials: 'JD',
            fullName: 'John Doe',
            email: 'johndoel@gmail.com',
          ),
        ],
      ),
    );
  }
}
