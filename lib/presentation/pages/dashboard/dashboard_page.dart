import 'package:flutter/material.dart';
import '../../core/theme/colors.dart';
import '../../widgets/flat_insight_card.dart';
import '../../widgets/transaction_row.dart';
import '../../widgets/chart_placeholder.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Row(
        children: [
          // Sidebar Segregada Rigorosamente (Apenas 2 abas)
          Container(
            width: 260,
            decoration: const BoxDecoration(
              color: AppColors.surfaceContainerLowest,
              border: Border(right: BorderSide(color: AppColors.surfaceContainerHigh)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(width: 8, height: 8, decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle)),
                          const SizedBox(width: 12),
                          const Text('DENARO_V1', style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w900, color: AppColors.onSurface, letterSpacing: 2, fontSize: 14)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text('TERMINAL ACTIVE', style: TextStyle(fontFamily: 'RobotoMono', color: AppColors.onSurfaceVariant, fontSize: 10)),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _buildNavItem(Icons.grid_view_rounded, 'Dashboard', true),
                _buildNavItem(Icons.settings_outlined, 'Settings', false),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('SYSTEM OPERATOR', style: TextStyle(fontFamily: 'Inter', fontSize: 10, color: AppColors.onSurfaceVariant)),
                      Text('CONNECTED', style: TextStyle(fontFamily: 'RobotoMono', fontSize: 10, color: AppColors.primary)),
                    ],
                  ),
                )
              ],
            ),
          ),
          
          // Main Body HFT Tático
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Header Focus C-Level
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Terminal Overview', style: TextStyle(fontFamily: 'Inter', fontSize: 26, fontWeight: FontWeight.bold, color: AppColors.onSurface, letterSpacing: -0.5)),
                          SizedBox(height: 6),
                          Text('Last sync: 2026-10-14 08:42:11', style: TextStyle(fontFamily: 'RobotoMono', fontSize: 12, color: AppColors.onSurfaceVariant)),
                        ],
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.onPrimary,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)), // FLAT ABSOLUTO CAIXA DURA
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20)
                        ),
                        onPressed: () { 
                          // TODO: Invocar Riverpod CsvParserProvider (Tratador Anti-Exfiltração) 
                        },
                        icon: const Icon(Icons.upload_file, size: 18),
                        label: const Text('IMPORT CSV', style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w800, letterSpacing: 1.5, fontSize: 11)),
                      )
                    ],
                  ),
                  const SizedBox(height: 48),
                  
                  // Insights Minimalista Row
                  const Row(
                    children: [
                      FlatInsightCard(title: 'Net Position', amount: '\$ 42,850.00', isIncome: true, icon: Icons.account_balance),
                      SizedBox(width: 16),
                      FlatInsightCard(title: 'Inflow', amount: '+ \$ 15,200.00', isIncome: true, icon: Icons.arrow_downward),
                      SizedBox(width: 16),
                      FlatInsightCard(title: 'Outflow', amount: '- \$ 3,450.00', isIncome: false, icon: Icons.arrow_upward),
                    ],
                  ),
                  const SizedBox(height: 48),

                  // Chart Placeholder (Vazio Inativo)
                  const ChartPlaceholder(),

                  // Ledger / Transacoes Assíncronas
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    decoration: const BoxDecoration(
                      color: AppColors.surfaceContainerHigh,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4))
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('LEDGER', style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w800, fontSize: 12, letterSpacing: 1.5, color: AppColors.onSurface)),
                        Row(
                          children: [
                            Text('FILTER', style: TextStyle(fontSize: 10, color: AppColors.onSurfaceVariant, letterSpacing: 1, fontWeight: FontWeight.bold)),
                            SizedBox(width: 16),
                            Text('EXPORT', style: TextStyle(fontSize: 10, color: AppColors.onSurfaceVariant, letterSpacing: 1, fontWeight: FontWeight.bold)),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainer,
                        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4))
                      ),
                      child: ListView(
                        children: const [
                          // Entradas Simuladas Pós-Fase 2 (Emulação visual exata do mock aprovado)
                          TransactionRow(dateStr: '12 OCT 2026', description: 'UBER PGTO', category: 'TRANSPORT', amountStr: '- 25.50', isIncome: false),
                          TransactionRow(dateStr: '12 OCT 2026', description: 'WHOLE FOODS MKT', category: 'GROCERIES', amountStr: '- 142.80', isIncome: false),
                          TransactionRow(dateStr: '11 OCT 2026', description: 'CORP SALARY DIRECT DEP', category: 'INCOME', amountStr: '+ 5,200.00', isIncome: true),
                          TransactionRow(dateStr: '10 OCT 2026', description: 'AMAZON WEB SERVICES', category: 'SOFTWARE', amountStr: '- 85.00', isIncome: false),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Container(
      decoration: BoxDecoration(
        color: isActive ? AppColors.surfaceContainerLowest : Colors.transparent, // Mantendo limpo e escuro
        border: Border(left: BorderSide(color: isActive ? AppColors.primary : Colors.transparent, width: 2))
      ),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Row(
        children: [
          Icon(icon, size: 20, color: isActive ? AppColors.primary : AppColors.onSurfaceVariant),
          const SizedBox(width: 16),
          Text(label.toUpperCase(), style: TextStyle(fontFamily: 'Inter', color: isActive ? AppColors.onSurface : AppColors.onSurfaceVariant, fontWeight: FontWeight.bold, letterSpacing: 1.2, fontSize: 11)),
        ],
      ),
    );
  }
}
