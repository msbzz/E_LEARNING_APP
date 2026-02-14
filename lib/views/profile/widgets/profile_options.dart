import 'package:e_learning_app/core/utils/app_dialogs.dart';
import 'package:e_learning_app/routes/app_routes.dart';
import 'package:e_learning_app/views/profile/widgets/profile_options_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileOptionsCard(
          title: 'Edit Profile',
          subtitle: 'Update your personal information',
          icon: Icons.edit_outlined,
          onTap: () {},
        ),
        ProfileOptionsCard(
          title: 'Notifications',
          subtitle: 'Manage your notifications',
          icon: Icons.notifications_outlined,
          onTap: () {},
        ),
        ProfileOptionsCard(
          title: 'Settings',
          subtitle: 'App preferences and more',
          icon: Icons.settings_outlined,
          onTap: () {},
        ),
        ProfileOptionsCard(
          title: 'Help and Support',
          subtitle: 'Get help or contact support',
          icon: Icons.help_outlined,
          onTap: () {},
        ),
        ProfileOptionsCard(
          title: 'Logout',
          subtitle: 'Sign out your account',
          icon: Icons.logout,
          onTap: () async {
            final confirm = await AppDialogs.showLogutDialog();
            if (confirm == true) {
              // navigate to login page
              Get.offAllNamed(AppRoutes.login);
            }
          },
          isDestruction: true,
        ),
      ],
    );
  }
}
