import 'dart:async';
import 'dart:io' show File, FileMode;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ruan_design_system/ruan_design_system.dart';

import 'screens/dashboard_screen.dart';

const String _kErrorLogFile = 'flutter_error_log.txt';

void _writeErrorToFile(String message) {
  if (kIsWeb) return;
  try {
    final f = File(_kErrorLogFile);
    f.writeAsStringSync(
      '${DateTime.now()}\n$message\n${'-' * 40}\n',
      mode: FileMode.append,
    );
  } catch (_) {}
}

void main() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    final msg =
        '${details.exceptionAsString()}\n${details.stack?.toString() ?? ''}';
    debugPrint(msg);
    _writeErrorToFile('FlutterError:\n$msg');
  };
  ErrorWidget.builder = (details) {
    final msg = 'Erro: ${details.exception}\n\n${details.stack ?? ''}';
    _writeErrorToFile('ErrorWidget:\n$msg');
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Text(
              msg,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
        ),
      ),
    );
  };
  runZonedGuarded(() {
    runApp(const FinanceApp());
  }, (error, stack) {
    final msg = 'Zone error: $error\nStack: $stack';
    debugPrint(msg);
    _writeErrorToFile(msg);
  });
}

class FinanceApp extends StatelessWidget {
  const FinanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance App',
      theme: RuanTheme.light,
      home: const DashboardScreen(),
    );
  }
}
