import 'package:flutter/material.dart';
import '../core/theme/colors.dart';

class ChartPlaceholder extends StatelessWidget {
  const ChartPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 40),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.outlineVariant.withValues(alpha: 0.3)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: CustomPaint(
          painter: _DottedGridPainter(),
          child: const Center(
            child: Text(
              '[ AWAITING DISTRIBUTION METRICS ]',
              style: TextStyle(
                fontFamily: 'RobotoMono',
                color: AppColors.outlineVariant,
                letterSpacing: 2.0,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DottedGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.outlineVariant.withValues(alpha: 0.3)
      ..style = PaintingStyle.fill;
    
    // Desenha o Grid pontilhado exato do CSS radial-gradient (16px spacing)
    for (double x = 0; x < size.width; x += 16) {
      for (double y = 0; y < size.height; y += 16) {
        canvas.drawCircle(Offset(x, y), 1.0, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
