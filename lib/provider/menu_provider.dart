import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:menu_say/constants/constant.dart';
import 'package:menu_say/enum/app_connection_status.dart';

import '../model/menu_model.dart';
import '../pages/main_page/home_page/home_page.dart';

class MenuProvider with ChangeNotifier {
  AppConnectionStatus connectionStatus = AppConnectionStatus.none;
  late MenuModel menu;

  getMenu({required String id, required BuildContext context}) async {
    try {
      connectionStatus = AppConnectionStatus.loading;
      notifyListeners();
      var res = await http.get(Uri.parse("$baseUrl/menu/get_menu/$id"));
      print("response : ${res.body}");
      menu = MenuModel.fromJson(jsonDecode(res.body));
      connectionStatus = AppConnectionStatus.success;
      notifyListeners();
      Navigator.of(context).pushNamed(HomePage.routeName);
    } catch (e) {
      connectionStatus = AppConnectionStatus.error;
      notifyListeners();
    }
  }

}
