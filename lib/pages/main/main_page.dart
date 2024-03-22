import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/pages/common_screen.dart';
import 'package:provider_example/pages/main/user_page.dart';
import 'package:provider_example/provider/main_provider.dart';
import 'package:provider_example/provider/user_provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final userProvider = UserProvider();

  @override
  Widget build(BuildContext context) {
    return BaseScreen(MultiProvider(providers: [
      ChangeNotifierProvider<MainProvider>(create: (context) => MainProvider(context)),
      ChangeNotifierProvider.value(
        value: userProvider,
      ),
    ], child: _buildPage(context)));
  }

  Widget _buildPage(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Consumer<UserProvider>(builder: (context, provider, child) {
          return Text("카운트 : ${provider.state.count}");
        }),
        Consumer<MainProvider>(builder: (context, provider, child) {
          return Center(
            child: ElevatedButton(
              onPressed: () {
                provider.startMainPage().then((value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserPage(
                              userProvider: userProvider,
                            )),
                  );
                });
              },
              child: const Text("대시보드"),
            ),
          );
        }),
      ],
    );
  }
}
