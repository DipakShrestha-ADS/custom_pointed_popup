import 'package:flutter/rendering.dart';

class TrianglePainter extends CustomPainter {
  bool isDown;
  Color color;
  TriangleDirection triangleDirection;
  TrianglePainter({
    this.isDown = true,
    required this.color,
    this.triangleDirection = TriangleDirection.Left,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint _paint = new Paint();
    _paint.strokeWidth = 2.0;
    _paint.color = color;
    _paint.style = PaintingStyle.fill;

    Path path = new Path();
    if (isDown) {
      path.moveTo(0.0, -1.0);
      path.lineTo(size.width, -1.0);
      if (triangleDirection == TriangleDirection.Straight) {
        path.lineTo(size.width / 2.0, size.height);
      } else if (triangleDirection == TriangleDirection.FullLeft) {
        path.lineTo(size.width / -2.0, size.height);
      } else if (triangleDirection == TriangleDirection.Left) {
        path.lineTo(size.width / 4.0, size.height);
      } else if (triangleDirection == TriangleDirection.FullRight) {
        path.lineTo(size.width / 0.5, size.height);
      } else if (triangleDirection == TriangleDirection.Right) {
        path.lineTo(size.width / 1.0, size.height);
      }
    } else {
      if (triangleDirection == TriangleDirection.Straight) {
        path.moveTo(size.width / 2.0, 0.0);
      } else if (triangleDirection == TriangleDirection.FullLeft) {
        path.moveTo(size.width / -2.0, 0.0);
      } else if (triangleDirection == TriangleDirection.Left) {
        path.moveTo(size.width / 4.0, 0.0);
      } else if (triangleDirection == TriangleDirection.FullRight) {
        path.moveTo(size.width / 0.5, 0.0);
      } else if (triangleDirection == TriangleDirection.Right) {
        path.moveTo(size.width / 1.0, 0.0);
      }

      path.lineTo(0.0, size.height + 1);
      path.lineTo(size.width, size.height + 1);
    }

    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

enum TriangleDirection {
  Straight,
  Right,
  FullRight,
  Left,
  FullLeft,
}
