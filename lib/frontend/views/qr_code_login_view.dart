// // dependencies:
//   // mobile_scanner: ^3.0.0
  
// import 'package:flutter/material.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';

// // https://github.com/juliansteenbakker/mobile_scanner

// class QrScanner extends StatelessWidget {
//   MobileScannerController cameraController = MobileScannerController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Mobile Scanner'),
//           actions: [
//             IconButton(
//               color: Colors.white,
//               icon: ValueListenableBuilder(
//                 valueListenable: cameraController.torchState,
//                 builder: (context, state, child) {
//                   switch (state as TorchState) {
//                     case TorchState.off:
//                       return const Icon(Icons.flash_off, color: Colors.grey);
//                     case TorchState.on:
//                       return const Icon(Icons.flash_on, color: Colors.yellow);
//                   }
//                 },
//               ),
//               iconSize: 32.0,
//               onPressed: () => cameraController.toggleTorch(),
//             ),
//             IconButton(
//               color: Colors.white,
//               icon: ValueListenableBuilder(
//                 valueListenable: cameraController.cameraFacingState,
//                 builder: (context, state, child) {
//                   switch (state as CameraFacing) {
//                     case CameraFacing.front:
//                       return const Icon(Icons.camera_front);
//                     case CameraFacing.back:
//                       return const Icon(Icons.camera_rear);
//                   }
//                 },
//               ),
//               iconSize: 32.0,
//               onPressed: () => cameraController.switchCamera(),
//             ),
//           ],
//         ),
//         body: MobileScanner(
//           // fit: BoxFit.contain,
//           controller: cameraController,
//           onDetect: (capture) {
//             final List<Barcode> barcodes = capture.barcodes;
//             final Uint8List? image = capture.image;
//             print(barcodes.length);
//             if(barcodes.isNotEmpty) {
//               print(barcodes[0]);

//               // ako ova e tekstto od qr prati go vo auth service
//               // vo auth service napravi funkcija koja ke pravi api povik so setiran bearer token od localStorage
//               // i vo body ke go ispraka stringov od barcode
//               // vo sidebar dodadi use edno kopce scan qr login koe ke se pokazuva ako vo localStorage ima token
//             }
//             for (final barcode in barcodes) {
//               debugPrint('Barcode found! ${barcode.rawValue}');
//             }
//           },
//         ),
//     );
//   }
// }
  
