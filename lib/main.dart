import 'package:flutter/material.dart';
import 'package:provider_example/pages/on_boarding_page.dart';
import 'package:provider_example/provider/base_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider<BaseProvider>(
              create: (context) => BaseProvider(),
            )
          ],
          child: const MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OnBoardingPage(),
    );
  }
}
