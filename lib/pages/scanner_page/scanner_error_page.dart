

import 'package:flutter/material.dart';

class ScannerErrorPage extends StatelessWidget {
  static const routeName = "scanner-error-page";

  const ScannerErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Invalid Scanner"),
      ),
    );
  }
}
