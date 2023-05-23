import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menu_say/enum/app_connection_status.dart';
import 'package:menu_say/helper/sp_helper.dart';
import 'package:menu_say/pages/loading_page.dart';
import 'package:menu_say/pages/scanner_page/scanner_error_page.dart';
import 'package:menu_say/provider/menu_provider.dart';
import 'package:provider/provider.dart';

class QRScannedPage extends StatefulWidget {
  static const routeName = "scanned-page";

  final String data;

  const QRScannedPage({Key? key, required this.data}) : super(key: key);

  @override
  State<QRScannedPage> createState() => _QRScannedPageState();
}

class _QRScannedPageState extends State<QRScannedPage> {
  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() async {
    Map<String, dynamic> map = jsonDecode(widget.data);
    String? menuId = map["id"];
    if (menuId != null) {
      await SpHelper().saveString(SpKey.menuId, menuId);
      await Provider.of<MenuProvider>(context, listen: false)
          .getMenu(id: menuId, context: context);
    } else {
      Navigator.of(context).pushReplacementNamed(ScannerErrorPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MenuProvider>(builder: (context, menuProvider, _) {
        if(menuProvider.connectionStatus == AppConnectionStatus.error){
          return ScannerErrorPage();
        }
        return const Center(child: LoadingPage());
      }),
    );
  }
}


