import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRPage extends StatelessWidget {
  const QRPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Scanner')),
      body: MobileScanner(
        allowDuplicates: false,
        controller: MobileScannerController(),
        onDetect: (qrcode, args) {
          if (qrcode.rawValue == null) return;
          final code = qrcode.rawValue!.split(':');
          Navigator.pop(context, code[1]);
        },
      ),
    );
  }
}
