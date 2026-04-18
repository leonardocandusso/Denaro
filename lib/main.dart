import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/logger/local_logger.dart';
import 'data/database/database_provider.dart';
import 'presentation/core/theme/app_theme.dart';
import 'presentation/pages/dashboard/dashboard_page.dart';

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
      themeMode: ThemeMode.dark, // Forçado para Dark institucional
      darkTheme: AppTheme.darkTheme,
      home: const DashboardPage(),
    );
  }
}
