

import 'package:flutter/cupertino.dart';

import '../constants/constant.dart';
import '../enum/app_connection_status.dart';
import 'package:http/http.dart' as http;


class OrderProvider with ChangeNotifier{
  AppConnectionStatus connectionStatus = AppConnectionStatus.none;


  getOrder() async {
    connectionStatus = AppConnectionStatus.loading;
    notifyListeners();
    var res = await http.get(Uri.parse("$baseUrl/order/user/getorder/id"),);
  }
}