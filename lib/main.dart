import 'package:amrita_gatepass/service.dart';
import 'package:amrita_gatepass/service_config.dart';
import 'package:amrita_gatepass/themes/app_colors.dart';
import 'package:amrita_gatepass/routes/app_pages.dart';
import 'package:amrita_gatepass/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
void main() async{
    await Get.putAsync<VenderService>(() => VenderService().init());
    HttpClient.init();

  runApp(MyApp());

}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget{
Widget build(BuildContext context) {
  return ScreenUtilInit(
    designSize: const Size(360, 690),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (_, child) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Amrita GatePass',
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: AppColors.primaryColor,
          ),
          textTheme: GoogleFonts.poppinsTextTheme()
        ),
        initialRoute: AppRoutes.homePage,
        getPages: AppPages.pages,
      );
    },
  );
}
}