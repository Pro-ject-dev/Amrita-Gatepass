import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
class Console {

  static void log(dynamic text) => kReleaseMode?'':Logger().d(text);
  static void error(dynamic text) => kReleaseMode?'':Logger().e(text);
  static void warning(dynamic text) => kReleaseMode?'':Logger().w(text);
  static void info(dynamic text) => kReleaseMode?'':Logger().i(text);
}
