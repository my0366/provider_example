import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  static void showToast(String message, BuildContext context, {bool isError = false}) {
    final fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
      width : double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xFF494A43),
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          Text(message, style: const TextStyle(color: Colors.white),)
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 1),
    );
  }
}
