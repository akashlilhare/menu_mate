
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

 const String baseUrl ="https://digital-menu-pi.vercel.app";

class Constants{



  BoxDecoration getDecoration({required BuildContext context}) {
    bool isDark = Theme.of(context).textTheme.bodyText1!.color == Colors.white;
    return BoxDecoration(
      color: isDark? const Color(0xff222222): Theme.of(context).cardColor,
      boxShadow: [
        BoxShadow(
            color: isDark?Colors.white30:Theme.of(context).primaryColor.withOpacity(.4),
            blurRadius: 2.0,
            offset:const Offset(0, 0)),
      ],
      borderRadius: const BorderRadius.all(Radius.circular(12)),
    );
  }

  getToast({required String title}) {
    Fluttertoast.showToast(
        msg: title,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        fontSize: 16.0);
  }

}