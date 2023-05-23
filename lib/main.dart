import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:menu_say/constants/app_theme.dart';
import 'package:menu_say/pages/intro_page/onbarding_page.dart';
import 'package:menu_say/provider/menu_provider.dart';
import 'package:menu_say/provider/order_porvider.dart';
import 'package:provider/provider.dart';

import 'router.dart' as router;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarColor: Colors.black));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final _routes = router.Router();
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MenuProvider()),
          ChangeNotifierProvider(create: (context) => OrderProvider()),
        ],
        builder: (context, _) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: lightTheme,
            debugShowCheckedModeBanner: false,
            home: OnBoardingPage(),
            onGenerateRoute: _routes.generateRoute,
            initialRoute: OnBoardingPage.routeName,
          );
        });
  }
}
