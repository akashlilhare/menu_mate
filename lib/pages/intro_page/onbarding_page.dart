import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:menu_say/generated/assets.dart';

import '../scanner_page/qr_code_scanner.dart';

class OnBoardingPage extends StatefulWidget {
  static const String routeName = "on-boarding-page";
  const OnBoardingPage({super.key});

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => QRCodeScannerPage()),
    );
  }


  Widget _buildImage(String assetName, [double width = 250]) {
    return Padding(
        padding: const EdgeInsets.only(top: 50,left: 50,right: 50,bottom: 50),
        child: Image.asset(assetName, width: width));
  }

  @override
  Widget build(BuildContext context) {
    TextStyle bodyStyle = TextStyle(fontSize: 18.0,color: Colors.black.withOpacity(.8));

    PageDecoration pageDecoration =  PageDecoration(
      imageFlex: 3,
      bodyFlex: 2,
      titleTextStyle: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(top: 16, right: 16),
              child: TextButton(
                child: Text(
                  "Skip",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                onPressed: () {},
              )),
        ),
      ),


      pages: [
        PageViewModel(
          title: "Ordering made easy\nscan and go!",
          body: "Simply scan the items you want to purchase and add them to your order.",
          image: _buildImage(Assets.introScanner),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Fast, convenient, and delicious",
          body:
              "You can enjoy tasty meals without the hassle of cooking or waiting in line. Simply browse menu for purchase and place your order.",
          image: _buildImage(Assets.introWaiter),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Take the hassle out of ordering",
          body:
              "Take the time to fully savor your meal by paying attention to the flavors and textures of the food.",
          image: _buildImage(Assets.introEating),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done:  const Text('Start', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),

      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}

