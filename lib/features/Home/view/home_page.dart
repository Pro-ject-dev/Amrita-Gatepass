import 'package:amrita_gatepass/themes/app_colors.dart';
import 'package:amrita_gatepass/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.appBarForeGroundColor,
        leading: Icon(Icons.home),
        actions: [ Padding(
          padding:  EdgeInsets.only(right:8.0.w),
          child: Icon(Icons.history),
        ) ],
        backgroundColor: AppColors.primaryColor,
        title: Text("Home"),
      ),
      body: Center(
        child: MaterialButton(
          color: AppColors.primaryColor,
          onPressed: () {
          Get.toNamed(AppRoutes.scannerPage);
        }, child: Text("OPEN SCANNER",style: TextStyle(color: AppColors.textColorWhite),)),
      ),
    );
  }
}
