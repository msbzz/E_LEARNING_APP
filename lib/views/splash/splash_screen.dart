import 'package:e_learning_app/bloc/auth/auth_bloc.dart';
import 'package:e_learning_app/bloc/auth/auth_state.dart';
import 'package:e_learning_app/routes/app_routes.dart';
import 'package:e_learning_app/sevices/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
        );

    _animationController.forward();

    Future.delayed(const Duration(seconds: 3), () {
      debugPrint(" <<<<<<<<<<<< into <==> Future.delayed >>>>>>>>>>>>>>");

      if (mounted || _hasNavigated) {
        _handleNavigation(context);
      }
    });
  }

  void _handleNavigation(BuildContext context) {
    if (_hasNavigated) return;
    _hasNavigated = true;

    final authState = context.read<AuthBloc>().state;

    debugPrint(
      "StorageService.isFirstTime() ==> ${StorageService.isFirstTime()}",
    );

    if (StorageService.isFirstTime()) {
      //StorageService.setFirstTime(false);
      // navigate to onboarding screen
      Get.offNamed(AppRoutes.onboarding);
    } else if (authState.userModel != null) {
      // navigate to home screen
      Get.offNamed(AppRoutes.home);
    } else {
      // navigate to login screen
      Get.offNamed(AppRoutes.login);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        color: theme.colorScheme.primary,
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surface,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.school,
                        size: 80,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Column(
                      children: [
                        Text(
                          'EduLearn Pro',
                          style: theme.textTheme.displayMedium?.copyWith(
                            color: theme.colorScheme.surface,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Learn Anywhere, Achieve Everywhere',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: theme.colorScheme.surface.withValues(
                              alpha: 0.7,
                            ),
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                // loading indicatior
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: CircularProgressIndicator(
                    color: theme.colorScheme.surface,
                    strokeWidth: 3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
