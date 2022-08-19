import 'dart:developer';

import 'package:flutter/foundation.dart';

class Logger {
  // TODO: change prefix to your app's name
  static const String prefix = 'Template';

  static void e(String message, Object? exception, {StackTrace? stackTrace}) {
    if (kDebugMode) {
      log(
        message,
        name: '$prefix: ${DateTime.now().toString()}',
        time: DateTime.now(),
        error: exception,
        stackTrace: stackTrace ?? StackTrace.current,
      );
    }
  }

  static void d(String message) {
    if (kDebugMode) {
      log(
        message,
        name: '$prefix: ${DateTime.now().toString()}',
        time: DateTime.now(),
      );
    }
  }
}
