import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/logger/local_logger.dart';
import 'data/database/database_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicialização das camadas Core e Data antes da UI
  await LocalLogger.init();
  await DatabaseProvider.initialize();

  runApp(const ProviderScope(child: DenaroApp()));
}

class DenaroApp extends StatelessWidget {
  const DenaroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Denaro',
      themeMode: ThemeMode.system, // Preparação para Dark/Light mode da Fase 3
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.light),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.dark),
      ),
      home: const Scaffold(
        body: Center(
          child: Text('Denaro - Fundação Data Carregada.'),
        ),
      ),
    );
  }
}
