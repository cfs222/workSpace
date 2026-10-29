import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:himah/core/databases/cache/cache_helper.dart';
import 'package:himah/core/theme/app_theme.dart';
import 'package:himah/features/start_screen/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final cacheHelper = CacheHelper();
  await cacheHelper.init();

  runApp(
    ProviderScope(
      overrides: [
        // سنضيف الـ providers هنا بعد قليل
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Himah',
      theme: AppTheme.dark,
      home: const WelcomeScreen(),
    );
  }
}
