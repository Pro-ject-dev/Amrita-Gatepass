import 'package:amrita_gatepass/features/History/controller/visitor_history_logs_controller.dart';
import 'package:amrita_gatepass/utils/widgets/comman_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';


class VisitorHistoryLogs extends GetView<VisitorHistoryLogsController> {
  const VisitorHistoryLogs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: CommonAppBar(
        name: "Vistor History Logs",
      ),
      body:  Center(
        child: Text(controller.visitorLogs.values.toString()),
      ),
    );
  }
}