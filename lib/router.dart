import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menu_say/pages/intro_page/onbarding_page.dart';
import 'package:menu_say/pages/main_page/home_page/home_page.dart';
import 'package:menu_say/pages/scanner_page/qr_code_scanner.dart';
import 'package:menu_say/pages/scanner_page/scanner_error_page.dart';
import 'package:menu_say/pages/scanner_page/sccaned_page.dart';

class Router {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case QRCodeScannerPage.routeName:
        return MaterialPageRoute<dynamic>(
          builder: (_) => QRCodeScannerPage(),
        );

      case QRScannedPage.routeName:
        return MaterialPageRoute<dynamic>(
          builder: (_) => QRScannedPage(data: settings.arguments as String),
        );

      case ScannerErrorPage.routeName:
        return MaterialPageRoute<dynamic>(
          builder: (_) => ScannerErrorPage(),
        );

      case OnBoardingPage.routeName:
        return MaterialPageRoute<dynamic>(
          builder: (_) => OnBoardingPage(),
        );

      case HomePage.routeName:
        return MaterialPageRoute<dynamic>(
          builder: (_) => HomePage(),
        );


      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text('Route not found!'),
                  ),
                ));
    }
  }

  void dispose() {
    // _overviewInitialCubit.close();
    // _cartCubit.close();
  }
}

class SlideUpRoute extends PageRouteBuilder<dynamic> {
  SlideUpRoute(this.page)
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            const begin = Offset(0, 0.5);
            const end = Offset.zero;
            final tween = Tween(begin: begin, end: end);
            final offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
  late Widget page;
}
