import 'package:amrita_gatepass/features/GatePass/controller/gatepass_controller.dart';
import 'package:amrita_gatepass/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GatepassDetails extends GetView<GatepassController> {
  const GatepassDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      appBar: AppBar(
        title: Text(
          "Visitor's Pass ",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        foregroundColor: AppColors.appBarForeGroundColor,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              // margin: EdgeInsets.all(10.sp),
              child: WebViewWidget(controller: controller.webViewController)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 11),
            child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
            MaterialButton(
              color:Colors.green,
              onPressed: (){},child: Text("In",style: TextStyle(fontSize:13.sp , color: Colors.white)),),
             MaterialButton(
                  color: const Color.fromARGB(255, 184, 16, 4),
              onPressed: (){},child: Text("Out",style: TextStyle(fontSize:13.sp,color: Colors.white)),),
                    ],
                  ),
          ),
      
      
         
        ],
      ),
    );
  }
}
