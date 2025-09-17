
import 'package:amrita_gatepass/logger.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../service.dart';

class VisitorHistoryLogsController extends GetxController {

  var visitorLogs = {}.obs;

 @override
void onInit() {
  super.onInit();
  getVisitorHistoryLogs(); 
}



Future<void> getVisitorHistoryLogs() async {
  try {
    var response = await VenderService().getVisitorLogs({
      "staff_id": "9063",
      "date": DateFormat('yyyy-MM-dd').format(DateTime.now()),
    });
  } catch (e) {
     Console.log("❌ Error in getVisitorHistoryLogs: $e");
  }
}

}
