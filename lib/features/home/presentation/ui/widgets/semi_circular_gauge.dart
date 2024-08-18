import 'dart:math';
import 'package:flutter/material.dart';

import '../../../../../core/ui/themes/theme.dart';

class SemiCircularGauge extends StatelessWidget {
  final double percentage;
  final double width;
  final Color color;

  const SemiCircularGauge({
    required this.percentage,
    required this.width,
    required this.color,
    Key? key,
  })  : assert(
          percentage >= 0 && percentage <= 100,
          'Percentage must be between 0 and 100',
        ),
        assert(
          width > 0,
          'Width must be greater than 0',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, width / 2),
      painter: _SemiCircularGaugePainter(percentage, color),
    );
  }
}

class _SemiCircularGaugePainter extends CustomPainter {
  final double percentage;
  final Color color;

  _SemiCircularGaugePainter(this.percentage, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15.0
      ..strokeCap = StrokeCap.round;

    final double radius = size.width / 2;
    const double startAngle = pi;
    final double sweepAngle = pi * (percentage / 100);

    // draw text in the center
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: '${percentage.toInt()}%',
        style: AppTextStyle.display4.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    canvas.drawArc(
      Rect.fromCircle(center: Offset(radius, radius), radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );

    canvas.drawArc(
      Rect.fromCircle(center: Offset(radius, radius), radius: radius),
      startAngle,
      pi,
      false,
      paint..color = color.withOpacity(0.25),
    );

    textPainter.paint(
      canvas,
      Offset(
        radius - textPainter.width / 2,
        radius - textPainter.height / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
