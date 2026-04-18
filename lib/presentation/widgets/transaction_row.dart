import 'package:flutter/material.dart';
import '../core/theme/colors.dart';

class TransactionRow extends StatelessWidget {
  final String dateStr;
  final String description;
  final String category;
  final String amountStr;
  final bool isIncome;

  const TransactionRow({
    super.key, 
    required this.dateStr, 
    required this.description, 
    required this.category, 
    required this.amountStr, 
    required this.isIncome
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.surfaceContainerLowest)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 2, child: Text(dateStr, style: const TextStyle(fontFamily: 'RobotoMono', color: AppColors.onSurfaceVariant, fontSize: 11))),
          Expanded(flex: 4, child: Text(description, style: const TextStyle(fontFamily: 'Inter', color: AppColors.onSurface, fontSize: 13), overflow: TextOverflow.ellipsis)),
          Expanded(
            flex: 3, 
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerHigh,
                  border: Border.all(color: AppColors.outlineVariant.withValues(alpha: 0.5)),
                  borderRadius: BorderRadius.circular(2)
                ),
                child: Text(category.toUpperCase(), style: const TextStyle(fontFamily: 'Inter', fontSize: 9, color: AppColors.onSurface, letterSpacing: 1, fontWeight: FontWeight.bold)),
              ),
            )
          ),
          Expanded(
            flex: 3, 
            child: Text(amountStr, textAlign: TextAlign.right, style: TextStyle(fontFamily: 'RobotoMono', color: isIncome ? AppColors.primary : AppColors.secondary, fontSize: 13, fontWeight: FontWeight.w500))
          ),
        ],
      ),
    );
  }
}
