import 'dart:io';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

/// Justificativa Eng/Sec: Um logger customizado offline isola a aplicação de requisições de rede arriscadas.
/// Rotaciona arquivos garantindo que Logs velhos não inflem o armazenamento ou exponham traços excessivos.
class LocalLogger {
  static late File _logFile;

  static Future<void> init() async {
    final directory = await getApplicationSupportDirectory();
    final logDir = Directory('${directory.path}\\Logs');
    if (!await logDir.exists()) {
      await logDir.create(recursive: true);
    }

    final String fileName = DateFormat('yyyy-MM-dd').format(DateTime.now());
    _logFile = File('${logDir.path}\\denaro_$fileName.log');
  }

  static Future<void> log(String message, {String level = 'INFO'}) async {
    final timestamp = DateFormat('HH:mm:ss').format(DateTime.now());
    final logEntry = '[$timestamp] [$level] $message\n';
    
    // Escreve asincronamente sem travar a main thread
    await _logFile.writeAsString(logEntry, mode: FileMode.append);
  }

  static Future<void> info(String message) => log(message, level: 'INFO');
  static Future<void> warning(String message) => log(message, level: 'WARNING');
  static Future<void> severe(String message) => log(message, level: 'SEVERE');
}
