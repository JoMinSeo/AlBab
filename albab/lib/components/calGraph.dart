import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:albab/Constants/constants.dart';

class AnimatedKcalGraph extends StatefulWidget {
  final double value;
  final Key key;

  AnimatedKcalGraph({this.value, this.key}) : super(key: key);

  @override
  _AnimatedKcalGraphState createState() => _AnimatedKcalGraphState();
}

class _AnimatedKcalGraphState extends State<AnimatedKcalGraph>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  double fraction = 0.0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    //여기
    controller = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          fraction = animation.value;
        });
      });
    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: KcalGrpah(fraction: fraction, value: widget.value),
    );
  }
}

class KcalGrpah extends CustomPainter {
  final double value;
  final double fraction;

  KcalGrpah({this.value, this.fraction});

  double rad(double angle) => pi / 180 * angle;

  @override
  void paint(Canvas canvas, Size size) {
    Gradient grad = LinearGradient(
        colors: [Colors.white, kBlue], stops: [0.2, 0.8]);
    Paint paint = Paint()
      ..color = kImproveGrey
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;
    double ang = value / 2400 * 360;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2 - paint.strokeWidth / 2,
        size.height / 2 - paint.strokeWidth / 2);
    canvas.drawCircle(center, radius, paint);
    paint..strokeWidth = 11;
    paint..strokeCap = StrokeCap.round;
    paint..color = kBlue.withOpacity(0.3);
    Path p = Path()
      ..addArc(
        Rect.fromCircle(center: center, radius: radius),
        rad(-90),
        rad(ang * fraction),
      );
    canvas.drawPath(p, paint);
    paint..strokeWidth = 8;
    paint..color = kBlue;
    canvas.drawPath(p, paint);
    drawText(canvas, size, "${value.toInt()}\n");
  }

  void drawText(Canvas canvas, Size size, String text) {
    TextSpan sp = TextSpan(
      style: kNaNumBold.copyWith(
          fontWeight: FontWeight.w500, color: kBlue, fontSize: 46),
      text: text,
      children: [
        TextSpan(
          style: kNaNumBold.copyWith(
              fontSize: 24,
              color: kPrimary,
              fontWeight: FontWeight.w300),
          text: "Kcal",
        ),
      ],
    );
    TextPainter tp = TextPainter(
      text: sp,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    tp.layout();

    double dx = size.width / 2 - tp.width / 2;
    double dy = size.height / 2 - tp.height / 2;

    Offset offset = Offset(dx, dy);
    tp.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
