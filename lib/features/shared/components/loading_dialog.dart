import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  static BuildContext? preContext;

  static show(context) {
    preContext ??= context;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => WillPopScope(
          onWillPop: () async => false, child: const LoadingDialog()),
    );
  }

  static close() {
    if (preContext != null) {
      Navigator.of(preContext!).pop();
      preContext = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            padding: const EdgeInsets.all(16),
            child: const CircularProgressIndicator()));
  }
}
