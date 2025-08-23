import 'package:amrita_gatepass/features/GatePass/controller/gatepass_controller.dart';
import 'package:get/get.dart';


class GatepassBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GatepassController>(
      () => GatepassController(),
    );
  }
}