import 'package:flutter/material.dart';
import 'package:lla/core/theme/theme.dart';
import 'package:lla/features/auth/presentation/pages/signin_page.dart';
import 'package:lla/features/dashboard/pages/home_page.dart';
import 'package:lla/providers/language_provider.dart';
import 'package:lla/providers/lesson_provider.dart';
import 'package:lla/providers/user_provider.dart';
import 'package:lla/services/auth_services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => LessonProvider()),
        ],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      authService.getUserData(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Auth App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkThemeMode,
        home: Scaffold(
          body: Material(
            child: Provider.of<UserProvider>(context).user.token.isEmpty
                ? const SignInPage()
                : const HomePage(),
            // child: HomePage(),
          ),
        ));
  }
}
