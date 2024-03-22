import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider/base_provider.dart';

class MainProvider extends ChangeNotifier {
  BuildContext context;
  late BaseProvider baseProvider;

  MainProvider(this.context) {
    baseProvider = context.read<BaseProvider>();
  }

  Future<void> startMainPage() async {
    await baseProvider.startAsyncLoading(() async {
      await Future.delayed(const Duration(seconds: 1));
    });
    notifyListeners();
  }
}