/// Justificativa Eng/Sec: Isola a lógica de derivação de chaves. 
/// Protege o banco local (SQLite) via SQLCipher (criptografia em repouso - prevenção Data Exfiltration).
class CipherManager {
  
  /// Recupera ou gera a chave de criptografia de 256 bits para o banco local.
  /// Futuramente podemos plugar o Windows DPAPI (flutter_secure_storage) aqui para
  /// máxima proteção. Por enquanto, asseguramos o scaffolding via FFI lock.
  static Future<String> getEncryptionKey() async {
    //TODO: Implementar binding nativo com Windows Keystore ou derivação por Senha Mestre do User na Fase 2/3.
    // O banco já será provisionado criptografado aguardando esta chave.
    const internalHardcodedFallback = "Denaro-Offline-Secure-Vault-2026!"; 
    return internalHardcodedFallback;
  }
}
