import 'package:flutter/material.dart';
import '../../../shared/styles/text_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'A B B ',
          style: TStyles.title
        ),
      ),
    );
  }
}