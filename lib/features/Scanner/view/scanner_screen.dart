import 'package:amrita_gatepass/features/Scanner/controller/scanner_controller.dart';
import 'package:amrita_gatepass/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerScreen extends GetView<ScannerController> {
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: AppColors.appBarForeGroundColor,
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: controller.goBack,
        ),
        actions: [Padding(
          padding: EdgeInsets.only(right:8.0.w),
          child: Obx(() => GestureDetector(
                onTap: controller.toggleFlash,
                child: Container(
                
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    controller.isFlashOn.value ? Icons.flash_on : Icons.flash_off,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              )),
        ),],
        title:  Text(
          'Gate Pass Scanner',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      
      ),
      body: Stack(
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.sp),
              child: SizedBox(
                width:270.w ,
                height: 250.h,
                child: MobileScanner(
                  controller: controller.cameraController,
                  onDetect: (capture) {
                    final Barcode barcode = capture.barcodes.first;
                    if(barcode.rawValue!=null){
                    controller.onQRCodeDetected(barcode.rawValue.toString());
                    }
                   
                  },
                ),
              ),
            ),
          ),
          
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
            ),
            child: Stack(
              children: [  
                Center(
                  child: SizedBox(
                   width:270.w ,
              height: 250.h,
                    child: Stack(
                      children: [
                        Positioned(
                          top: -2,
                          left: -2,
                          child: Container(
                            width: 45.w,
                            height: 45.h,
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(color: Colors.white, width: 6.w),
                                left: BorderSide(color: Colors.white, width: 6.w),
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.sp),
                              ),
                            ),
                          ),
                        ),
                        
                        Positioned(
                          top: -2,
                          right: -2,
                          child: Container(
                             width: 45.w,
                            height: 45.h,
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(color: Colors.white, width: 6.w),
                                right: BorderSide(color: Colors.white, width: 6.w),
                              ),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        
    
                        Positioned(
                          bottom: -2,
                          left: -2,
                          child: Container(
                             width: 45.w,
                            height: 45.h,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.white, width: 6.w),
                                left: BorderSide(color: Colors.white, width: 6.w),
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        
                        Positioned(
                          bottom: -2,
                          right: -2,
                          child: Container(
                            width: 45.w,
                            height: 45.h,
                            decoration:  BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.white, width: 6.w),
                                right: BorderSide(color: Colors.white, width: 6.w),
                              ),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(15.sp),
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
       
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding:  EdgeInsets.all(24.sp),
            
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 16.sp),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor, 
                      borderRadius: BorderRadius.circular(12.sp),
                    ),
                    child:  Column(
                      children: [
                        Text(
                          'Scan QR code to get gate pass',
                          style: TextStyle(
                            color:AppColors.textColorWhite,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Quickly and get gate pass',
                          style: TextStyle(
                            color: AppColors.appBarForeGroundColor.withOpacity(0.6),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                 SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
