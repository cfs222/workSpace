import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:himah/core/theme/theme.dart';
import 'package:himah/core/constants/app_assets.dart';
import 'package:himah/features/on_boarding/presentation/providers/appbar_step_provider.dart';
import 'package:himah/features/on_boarding/presentation/screens/on_boarding1.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background
          Image.asset(AppAssets.mountainsBg, fit: BoxFit.cover),

          // Content
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppSpacing.xl,
              horizontal: AppSpacing.pageHorizontal,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 84,
                ), // يمكن نقله لاحقاً لـ AppSpacing إذا تكرر
                // Logo
                Image.asset(AppAssets.himahLogo),

                const SizedBox(height: AppSpacing.md),

                // Arabic title
                Text('المؤمن القوي خير', style: AppTextStyles.welcomeTitle),

                const SizedBox(height: AppSpacing.md),

                // English caption
                Text(
                  'MAKE YOUR PROGRESS.',
                  style: AppTextStyles.welcomeCaption,
                ),

                const SizedBox(height: 20),

                // Accent line
                Container(width: 24, height: 2, color: AppColors.accentCyan),

                const Spacer(),

                // Primary action button
                SizedBox(
                  width: double.infinity,
                  height: AppSizes.buttonHeightLarge,
                  child: ElevatedButton(
                    onPressed: () {
                      ref.read(appBarOnBoardingStepProvider.notifier).state +=
                          1;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const OnBoarding1()),
                      );
                    },
                    child: Image.asset(
                      AppAssets.iconNext,
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
