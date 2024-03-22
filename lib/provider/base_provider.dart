import 'package:flutter/material.dart';
import 'package:provider_example/state/base_state.dart';

typedef FutureCallback = Future<void> Function();

class BaseProvider extends ChangeNotifier {

  final state = BaseState();

  Future<void> startAsyncLoading(FutureCallback callback) async {
    state.isLoading = true;
    notifyListeners();
    await callback.call();
    state.isLoading = false;
    notifyListeners();
  }

  void showDialogs(BuildContext context) {
    showDialog(context: context, builder: (context) {
      return const Dialog(
        child: Text("A"),
      );
    });
  }
}