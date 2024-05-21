import 'dart:math';

import 'package:flutter/material.dart';

class RuedaPainter extends CustomPainter {
  final Animation<double> animation;
  Color color;
  RuedaPainter({required this.animation, required this.color})
      : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint(); // Con paint definiremos las caracteristicas tanto de color y grosor de las lineas a la hora de dibujar.
    paint.color = color;
    paint.strokeWidth = 2;
    paint.style = PaintingStyle.stroke;

    final double radio = size.width / 2;
    final Offset centro = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(centro, radio, paint);
    // Dibujando las lineas
    for (int i = 0; i < 12; i++) {
      final double angulo = (i * 30 + animation.value * 360) * 0.0174533;

      final double x = centro.dx + radio * cos(angulo);
      final double y = centro.dy + radio * sin(angulo);
      //              punto inicio | Final | color y grosor de la linea
      canvas.drawLine(centro, Offset(x, y), paint);
    }

    final Paint paintTriangulo = Paint();
    paintTriangulo.color = color;
    paintTriangulo.strokeWidth = 2;
    paintTriangulo.style = PaintingStyle.fill;

    final Path trazoTriangulo = Path();
    trazoTriangulo.moveTo(
        centro.dx, centro.dy - radio + 10); // Base del triángulo
    trazoTriangulo.lineTo(centro.dx - 10,
        centro.dy - radio - 10); // Esquina izquierda del triángulo
    trazoTriangulo.lineTo(centro.dx + 10,
        centro.dy - radio - 10); // Esquina derecha del triángulo
    trazoTriangulo.close();

    canvas.drawPath(trazoTriangulo, paintTriangulo);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
