import 'package:amrita_gatepass/features/Scanner/controller/scanner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerScreen extends GetView<ScannerController> {
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: controller.goBack,
        ),
        title: const Text(
          'Student Scanner',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: controller.showMenu,
          ),
        ],
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: controller.cameraController,
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                if (barcode.rawValue != null) {
                  controller.onQRCodeDetected(barcode.rawValue!);
                }
              }
            },
          ),
          
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
            ),
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: 280,
                    height: 280,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                
                Center(
                  child: SizedBox(
                    width: 280,
                    height: 280,
                    child: Stack(
                      children: [
                        Positioned(
                          top: -2,
                          left: -2,
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(color: Colors.white, width: 4),
                                left: BorderSide(color: Colors.white, width: 4),
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        
                        Positioned(
                          top: -2,
                          right: -2,
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(color: Colors.white, width: 4),
                                right: BorderSide(color: Colors.white, width: 4),
                              ),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        
    
                        Positioned(
                          bottom: -2,
                          left: -2,
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.white, width: 4),
                                left: BorderSide(color: Colors.white, width: 4),
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        
                        // Bottom-right corner
                        Positioned(
                          bottom: -2,
                          right: -2,
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.white, width: 4),
                                right: BorderSide(color: Colors.white, width: 4),
                              ),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Flash toggle button
          Positioned(
            top: 100,
            right: 20,
            child: Obx(() => GestureDetector(
              onTap: controller.toggleFlash,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(
                  controller.isFlashOn.value ? Icons.flash_on : Icons.flash_off,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            )),
          ),
          
          // Bottom section
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF8E2D56), // Maroon color
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Column(
                      children: [
                        Text(
                          'Scan QR code to get student',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Quickly and get your student',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
