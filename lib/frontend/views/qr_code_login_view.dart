import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pc_builder_mk_mobile/frontend/views/pc_builder_view.dart';
import 'package:pc_builder_mk_mobile/frontend/widgets/navigation_drawer_widget.dart' as custom_nav_drawer;
import 'package:pc_builder_mk_mobile/service/auth_service.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeLoginView extends StatefulWidget {
  static const routeName = '/qr-login';
  static const title = 'QR Login';

  const QrCodeLoginView({super.key});

  @override
  State<StatefulWidget> createState() => QrCodeLoginViewState();
}

class QrCodeLoginViewState extends State<QrCodeLoginView> {
  final qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController? controller;


  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  String errorMessage = "";

  void _submit(barcode) async {
    setState(() {
      errorMessage = "";
    });
    if (barcode != null) {
      final hash = barcode?.code;
      final authService = AuthService.instance;
      final response = await authService.qrLogin(hash);
      if (response.success) {
        controller!.stopCamera();
        Navigator.pushReplacementNamed(context, PcBuilderScreen.routeName);
      } else {
        setState(() {
          errorMessage = response.message;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: _createAppBar(context),
      ),
      drawer: const custom_nav_drawer.NavigationDrawer(),
      body: _createBody(context),
    );
  }

  Widget _createBody(BuildContext context) {
    return QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
        cutOutSize: MediaQuery.of(context).size.width * 0.8,
borderWidth: 10,
        borderLength: 20,
        borderRadius: 10,
        borderColor: Colors.blueGrey
      ),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream
    .listen((barcode) => _submit(barcode));
  }

  Widget _createAppBar(BuildContext context) {
    return AppBar(
      // The title text which will be shown on the action bar
      title: const Text("QR Code Scan"),
    );
  }
}
