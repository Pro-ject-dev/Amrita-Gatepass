import 'package:amrita_gatepass/service_config.dart';
import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';


class VenderService extends GetxService {
  Future<VenderService> init() async {
    return this;
  }

  getVisitorPass(dto) async {
    Response res = await http!.post(
      'get-visitor-request-info',
      data: dto,
    );
    return res.data;
  }

  


}
