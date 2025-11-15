import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:get/get.dart';

class ScannerPage extends StatelessWidget {
  const ScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double scanBoxSize = 250; // Size of scan area

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          /// 📷 Scanner camera
          MobileScanner(
            onDetect: (barcodeCapture) {
              final barcodes = barcodeCapture.barcodes;
              for (final barcode in barcodes) {
                debugPrint("Barcode: ${barcode.rawValue}");
                Get.back(result: barcode.rawValue);
              }
            },
          ),

          /// 🕶 Dark overlay mask with transparent cutout
          LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.6),
                      BlendMode.srcOut,
                    ),
                    child: Stack(
                      children: [
                        // Full screen
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            backgroundBlendMode: BlendMode.dstOut,
                          ),
                        ),
                        // Transparent scan area
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: scanBoxSize,
                            height: scanBoxSize,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),

          /// 📐 Green focus corners
          Center(
            child: SizedBox(
              width: scanBoxSize,
              height: scanBoxSize,
              child: Stack(
                children: [
                  // Top-left corner
                  Positioned(
                    top: 0,
                    left: 0,
                    child: CustomPaint(
                      size: const Size(40, 40),
                      painter: _CornerPainter(),
                    ),
                  ),
                  // Top-right corner
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Transform.rotate(
                      angle: 1.5708,
                      child: CustomPaint(
                        size: const Size(40, 40),
                        painter: _CornerPainter(),
                      ),
                    ),
                  ),
                  // Bottom-left corner
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Transform.rotate(
                      angle: -1.5708,
                      child: CustomPaint(
                        size: const Size(40, 40),
                        painter: _CornerPainter(),
                      ),
                    ),
                  ),
                  // Bottom-right corner
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Transform.rotate(
                      angle: 3.1416,
                      child: CustomPaint(
                        size: const Size(40, 40),
                        painter: _CornerPainter(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// 🔙 Back button
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              color: Colors.white,
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Get.back(),
            ),
          ),
        ],
      ),
    );
  }
}

/// 🎨 Green corner painter
class _CornerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.greenAccent
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, 0)
      ..lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
