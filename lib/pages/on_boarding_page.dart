import 'package:flutter/material.dart';
import 'package:provider_example/pages/main/main_page.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MainPage()),
          );
        }, child: const Text("이동"),
      ) ,
    );
  }
}
