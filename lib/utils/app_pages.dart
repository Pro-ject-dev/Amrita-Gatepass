import 'package:amrita_gatepass/features/Scanner/bindings/scanner_bindings.dart';
import 'package:amrita_gatepass/features/Scanner/view/scanner_screen.dart';
import 'package:amrita_gatepass/utils/app_routes.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppPages {
   static final pages = [
    GetPage(
      name: AppRoutes.scannerPage,
      page: () => ScannerScreen(),
      binding: ScannerBindings(),
    ),
   ];
}