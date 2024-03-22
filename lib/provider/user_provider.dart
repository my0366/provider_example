import 'package:flutter/cupertino.dart';
import 'package:provider_example/provider/base_provider.dart';
import 'package:provider_example/state/user_state.dart';

class UserProvider extends ChangeNotifier {

  late BaseProvider baseProvider;

  final state = UserState();

  Future<void> updateCount() async {
    await baseProvider.startAsyncLoading(() async {
      state.count += 1;
      print(state.count);
      await Future.delayed(const Duration(seconds: 1));
    });
    notifyListeners();
  }
}