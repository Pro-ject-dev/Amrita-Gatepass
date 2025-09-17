import 'package:amrita_gatepass/features/History/controller/visitor_history_logs_controller.dart';
import 'package:get/get.dart';

class VisitorHistoryLogsBindings extends Bindings{
  @override
  void dependencies() {
     Get.lazyPut<VisitorHistoryLogsController>(
      () => VisitorHistoryLogsController(),
    );
  }
}