import 'package:e_learning_app/core/utils/validators.dart';
import 'package:e_learning_app/models/user_model.dart';
import 'package:e_learning_app/routes/app_routes.dart';
import 'package:e_learning_app/views/widgets/common/custom_button.dart';
import 'package:e_learning_app/views/widgets/common/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  UserRole? _selectedRole;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // top design
            Container(
              height: Get.height * 0.25,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColor.withValues(alpha: 0.8),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(100),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 50,
                    left: 20,
                    child: IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Create Account',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Start your learning journey',
                          style: TextStyle(fontSize: 16, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // full name textfield
                        CustomTextfield(
                          label: 'Full Name',
                          prefixIcon: Icons.person_outline,
                          contoller: _fullNameController,
                          validator: FormValidator.validateFullName,
                        ),
                        const SizedBox(height: 20),
                        // email textfield
                        CustomTextfield(
                          label: 'Email',
                          prefixIcon: Icons.email_outlined,
                          contoller: _emailController,
                          validator: FormValidator.validateEmail,
                        ),
                        const SizedBox(height: 20),
                        // password textfield
                        CustomTextfield(
                          label: 'Password',
                          prefixIcon: Icons.password_outlined,
                          contoller: _passwordController,
                          validator: FormValidator.validatePassword,
                          obscureText: true,
                        ),
                        const SizedBox(height: 20),
                        // confirm password textfield
                        CustomTextfield(
                          label: 'Confirm password',
                          prefixIcon: Icons.lock_outline,
                          contoller: _confirmPasswordController,
                          obscureText: true,
                          validator: (value) =>
                              FormValidator.validateConfirmPassword(
                                value,
                                _passwordController.text,
                              ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<UserRole>(
                    decoration: InputDecoration(
                      labelText: 'Role',
                      prefixIcon: const Icon(Icons.person_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    items: UserRole.values.map<DropdownMenuItem<UserRole>>((
                      UserRole role,
                    ) {
                      return DropdownMenuItem<UserRole>(
                        value: role,
                        child: Text(
                          role.toString().split('.').last.capitalize!,
                        ),
                      );
                    }).toList(),

                    onChanged: (UserRole? value) {
                      setState(() {
                        _selectedRole = value;
                      });
                    },
                  ),

                  const SizedBox(height: 30),

                  // register button
                  CustomButton(text: 'Register', onPressed: _handleRegister),

                  const SizedBox(height: 26),

                  // login link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleRegister() {
    if (_formKey.currentState!.validate() && _selectedRole != null) {
      if (_selectedRole == UserRole.teacher) {
        Get.offAllNamed(AppRoutes.teacherHome);
      } else {
        Get.offAllNamed(AppRoutes.main);
      }
    } else if (_selectedRole == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select a role'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
