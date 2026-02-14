import 'package:e_learning_app/views/profile/widgets/profile_options_card.dart';
import 'package:flutter/material.dart';

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
      ],
    );
  }
}
