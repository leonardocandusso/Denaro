import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/transaction_entity.dart';
import 'transactions_provider.dart';

part 'dashboard_controller.g.dart';

class DashboardMetrics {
  final double netPosition;
  final double totalInflow;
  final double totalOutflow;

  const DashboardMetrics({
    required this.netPosition,
    required this.totalInflow,
    required this.totalOutflow,
  });

  factory DashboardMetrics.empty() {
    return const DashboardMetrics(netPosition: 0, totalInflow: 0, totalOutflow: 0);
  }
}

@riverpod
class DashboardController extends _$DashboardController {
  @override
  DashboardMetrics build() {
    // Escuta Reativamente a Engine O(N) das Isolates de forma segura sem Jank
    final transactionsAsync = ref.watch(transactionsNotifierProvider);

    return transactionsAsync.maybeWhen(
      data: (transactions) => _computeAgregations(transactions),
      orElse: () => DashboardMetrics.empty(),
    );
  }

  DashboardMetrics _computeAgregations(List<TransactionEntity> transactions) {
    double inflow = 0;
    double outflow = 0;

    for (final tx in transactions) {
      if (tx.amount.value > 0) {
        inflow += tx.amount.value;
      } else {
        outflow += tx.amount.value.abs(); // Subtraímos matematicamente, mas guardamos o Modulo para C-Level view
      }
    }

    final netPosition = inflow - outflow;

    return DashboardMetrics(
      netPosition: netPosition,
      totalInflow: inflow,
      totalOutflow: outflow,
    );
  }
}
