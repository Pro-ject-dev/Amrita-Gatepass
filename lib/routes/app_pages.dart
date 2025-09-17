import 'package:amrita_gatepass/features/GatePass/bindings/gatepass_bindings.dart';
import 'package:amrita_gatepass/features/GatePass/view/gatepass_details.dart';
import 'package:amrita_gatepass/features/History/bindings/visitor_history_logs_bindings.dart';
import 'package:amrita_gatepass/features/History/view/visitor_history_logs.dart';
import 'package:amrita_gatepass/features/Home/bindings/home_bindings.dart';
import 'package:amrita_gatepass/features/Home/view/home_page.dart';
import 'package:amrita_gatepass/features/Scanner/bindings/scanner_bindings.dart';
import 'package:amrita_gatepass/features/Scanner/view/scanner_screen.dart';
import 'package:amrita_gatepass/routes/app_routes.dart';
import 'package:get/get_navigation/get_navigation.dart';


class AppPages {
   static final pages = [
    GetPage(
      name: AppRoutes.scannerPage,
      page: () => ScannerScreen(),
      binding: ScannerBindings(),
    ),
    GetPage(
      name: AppRoutes.homePage,
      page: () => HomePage(),
      binding: HomeBindings(),
    ),
      GetPage(
      name: AppRoutes.gatepass,
      page: () => GatepassDetails(),
      binding: GatepassBindings(),
    ),
    GetPage(
      name: AppRoutes.historylogs,
      page: () => VisitorHistoryLogs(),
      binding: VisitorHistoryLogsBindings(),
    ),
   ];
}