import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:menu_say/pages/scanner_page/sccaned_page.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


class QRCodeScannerPage extends StatefulWidget {
  static const routeName = "qr-code-scanner-page";

  const QRCodeScannerPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRCodeScannerPageState();
}

class _QRCodeScannerPageState extends State<QRCodeScannerPage> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Scan & Order")),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black45,
          elevation: 0,
          onPressed: () async {
            await controller?.toggleFlash();
            setState(() {});
          },
          child: FutureBuilder(
            future: controller?.getFlashStatus(),
            builder: (context, snapshot) {
              return (snapshot.data != null && snapshot.data == true)
                  ? Icon(Icons.flash_off)
                  : Icon(Icons.flash_on);
            },
          ),
        ),
        body: _buildQrView(context)
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery
        .of(context)
        .size
        .width < 400 ||
        MediaQuery
            .of(context)
            .size
            .height < 400)
        ? 220.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Theme
              .of(context)
              .primaryColor,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.resumeCamera();


    controller.scannedDataStream.listen((scanData) {
      if (scanData.code != null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) {
              return QRScannedPage(data: scanData.code!,);
            }));

        controller.pauseCamera();
        controller.dispose();
        return;
      }
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
