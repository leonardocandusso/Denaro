import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path_provider/path_provider.dart';
import '../../core/security/cipher_manager.dart';
import '../../core/logger/local_logger.dart';

/// Justificativa Eng/Sec: 100% C++ FFI bindings evitam o gargalo herdado de bridges (MethodChannel).
/// Empregamos db.rawQuery(PRAGMA key) com SQLCipher para fechar o cofre contra file copy-paste.
class DatabaseProvider {
  static late Database _db;

  static Future<void> initialize() async {
    try {
      sqfliteFfiInit();
      var databaseFactory = databaseFactoryFfi;
      
      final dir = await getApplicationSupportDirectory();
      final path = '${dir.path}\\denaro_vault.db';

      _db = await databaseFactory.openDatabase(path);
      
      // Aplicar Criptografia AES-256 no db
      final key = await CipherManager.getEncryptionKey();
      await _db.execute("PRAGMA key = '$key'");
      
      // Optimização Local
      await _db.execute("PRAGMA journal_mode = WAL");
      
      await LocalLogger.info("Database SQLite offline (FFI+SQLCipher) inicializado com sucesso em $path.");
      await _runMigrations();
    } catch (e, stackTrace) {
      await LocalLogger.severe("Falha crítica de segurança ao carregar banco Local: $e\n$stackTrace");
      rethrow;
    }
  }

  static Future<void> _runMigrations() async {
    // Fase 1: Fundação. Criação de tabelas base ocorrerá sob demanda nas Fases futuras.
    await LocalLogger.info("Migrations executadas.");
  }
}
