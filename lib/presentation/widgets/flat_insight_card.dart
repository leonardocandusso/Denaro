import 'package:flutter/material.dart';
import '../core/theme/colors.dart';

class FlatInsightCard extends StatelessWidget {
  final String title;
  final String amount;
  final bool isIncome;
  final IconData icon;

  const FlatInsightCard({
    super.key, 
    required this.title, 
    required this.amount, 
    required this.isIncome, 
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    // Design Minimalista Strict: Zero Elevation, Zero BackdropFilter
    return Expanded(
      child: Container(
        height: 120,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest, // Contraste fundo
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(color: isIncome ? AppColors.primary.withOpacity(0.3) : AppColors.secondary.withOpacity(0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 6, height: 6,
                      decoration: BoxDecoration(
                        color: isIncome ? AppColors.primary : AppColors.secondary,
                        shape: BoxShape.circle,
                      )
                    ),
                    const SizedBox(width: 8),
                    Text(title.toUpperCase(), 
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: isIncome ? AppColors.primary : AppColors.secondary, 
                        fontSize: 10, letterSpacing: 1.2, fontWeight: FontWeight.bold
                      )
                    ),
                  ],
                ),
                Icon(icon, size: 16, color: isIncome ? AppColors.primary : AppColors.secondary),
              ],
            ),
            Text(amount, 
              style: TextStyle(
                fontFamily: 'RobotoMono', 
                fontSize: 22, 
                color: isIncome ? AppColors.primary : AppColors.secondary, 
                fontWeight: FontWeight.bold
              )
            ),
          ],
        ),
      ),
    );
  }
}
