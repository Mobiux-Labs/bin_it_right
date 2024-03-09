import 'package:flutter/material.dart';
import 'package:reseacue/game/components/waste.dart';

import 'package:flame/components.dart';
import 'package:reseacue/game/game.dart';

class ArcComponent extends CustomPainterComponent
    with HasGameReference<Reseacue> {
  Vector2 leftTop;
  Vector2 rightTop;
  Vector2 leftBottom;
  Vector2 rightBottom;
  WasteType type;

  ArcComponent({
    required this.leftTop,
    required this.rightTop,
    required this.leftBottom,
    required this.rightBottom,
    required this.type,
  });

  @override
  Future<void> onLoad() async {
    painter = Arc(
      leftTop: leftTop,
      rightTop: rightTop,
      leftBottom: leftBottom,
      rightBottom: rightBottom,
      type: type,
      gameSize: game.size,
    );
  }
}

class Arc extends CustomPainter {
  Vector2 leftTop;
  Vector2 rightTop;
  Vector2 leftBottom;
  Vector2 rightBottom;
  WasteType type;
  Vector2 gameSize;

  Arc({
    required this.leftTop,
    required this.rightTop,
    required this.leftBottom,
    required this.rightBottom,
    required this.type,
    required this.gameSize,
  });

  late final dryWastePaint = Paint()
    ..color = const Color(0xFF00FFF0).withOpacity(0.3);

  late final wetWastePaint = Paint()
    ..color = const Color(0xFFCFFF00).withOpacity(0.3);

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(leftTop.x, leftTop.y);
    path.lineTo(rightTop.x, rightTop.y);
    path.quadraticBezierTo(
        (rightTop.x + rightBottom.x) / 2 + ((leftBottom.x - leftTop.x) / 2),
        (rightTop.y + rightBottom.y) / 2,
        rightBottom.x,
        rightBottom.y);
    path.quadraticBezierTo(
      leftBottom.x - ((leftBottom.x - rightBottom.x) / 2),
      leftBottom.y - ((leftBottom.x - rightBottom.x) / 2),
      leftBottom.x,
      leftBottom.y,
    );
    path.quadraticBezierTo(
        (leftTop.x + leftBottom.x) / 2 + ((leftBottom.x - leftTop.x) / 2),
        (leftTop.y + leftBottom.y) / 2,
        leftTop.x,
        leftTop.y);
    path.close();

    canvas.drawPath(
      path,
      type == WasteType.wet ? wetWastePaint : dryWastePaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
