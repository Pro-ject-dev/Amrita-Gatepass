import 'dart:convert';
import 'package:amrita_gatepass/logger.dart';
import 'package:amrita_gatepass/service_config.dart';
import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';


class VenderService extends GetxService {
  Future<VenderService> init() async {
    return this;
  }

  getVisitorPass(dto) async {
    Console.log("API call: getVisitorPass, data: $dto");
    try {
      Response res = await http!.post(
        'get-visitor-request-info',
        data: dto,
      );
      Console.log("API response: getVisitorPass, data: ${res.data}");
      return jsonDecode(res.data);
    } catch (e) {
      Console.error("API error: getVisitorPass, error: $e");
      rethrow;
    }
  }
  
  insertVisitorLog(dto) async {
    Console.log("API call: insertVisitorLog, data: $dto");
    try {
      Response res = await http!.post(
        'insert-visitor-log',
        data: dto,
      );
      Console.log("API response: insertVisitorLog, data: ${res.data}");
      return jsonDecode(res.data);
    } catch (e) {
      Console.error("API error: insertVisitorLog, error: $e");
      rethrow;
    }
  }
  

  getVisitorLogs(dto) async {
    Console.log("API call: getVisitorLogs, data: $dto");
    try {
      Response res = await http!.post(
        'get-visitor-gate-log',
        data: dto,
      );
      Console.log("API response: getVisitorLogs, data: ${res.data}");
      return res.data;
    } catch (e) {
      Console.error("API error: getVisitorLogs, error: $e");
      rethrow;
    }
  }


}
