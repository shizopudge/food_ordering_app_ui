import 'package:flutter/material.dart';
import 'constants/constants.dart';
import 'features/welcome/welcome_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: kDarkPurple,
        ),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}
