import 'dart:ui';

import 'package:flutter/material.dart';

class PathAnimation extends StatefulWidget {
  const PathAnimation({Key? key}) : super(key: key);

  @override
  _PathAnimationState createState() => _PathAnimationState();
}

class _PathAnimationState extends State<PathAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.duration = Duration(seconds: 08);
    _controller.value = 1.0;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Path Animation'),
      ),
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, widget) {
              return CustomPaint(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
                painter: MyCustomPainter(progress: _controller.value),
              );
            },
          ),
          Align(
            alignment: Alignment(0.0, 0.5),
            child: RawMaterialButton(
              onPressed: () {
                _controller.reset();
                _controller.forward();
              },
              child: Container(
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Animate',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  double progress;

  MyCustomPainter({required this.progress});

  Paint _paint = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2.0
    ..strokeJoin = StrokeJoin.round;

  @override
  void paint(Canvas canvas, Size size) {
    var pathForLetterF = createPathForF(size.width, size.height);
    PathMetrics pathMetricsForF = pathForLetterF.computeMetrics();
    for (PathMetric pathMetric in pathMetricsForF) {
      Path extractPath =
          pathMetric.extractPath(0.0, pathMetric.length * progress);
      canvas.drawPath(extractPath, _paint);
    }

    var pathForLetterL = createPathForL(size.width, size.height);
    PathMetrics pathMetricsForL = pathForLetterL.computeMetrics();
    for (PathMetric pathMetric in pathMetricsForL) {
      Path extractPath =
          pathMetric.extractPath(0.0, pathMetric.length * progress);
      canvas.drawPath(extractPath, _paint);
    }

    var pathForLetterU = createPathForU(size.width, size.height);
    PathMetrics pathMetricsForU = pathForLetterU.computeMetrics();
    for (PathMetric pathMetric in pathMetricsForU) {
      Path extractPath =
          pathMetric.extractPath(0.0, pathMetric.length * progress);
      canvas.drawPath(extractPath, _paint);
    }

    var pathForLetterT = createPathForT(size.width, size.height);
    PathMetrics pathMetricsForT = pathForLetterT.computeMetrics();
    for (PathMetric pathMetric in pathMetricsForT) {
      Path extractPath =
          pathMetric.extractPath(0.0, pathMetric.length * progress);
      canvas.drawPath(extractPath, _paint);
    }

    var pathForLetterT1 = createPathForT1(size.width, size.height);
    PathMetrics pathMetricsForT1 = pathForLetterT1.computeMetrics();
    for (PathMetric pathMetric in pathMetricsForT1) {
      Path extractPath =
          pathMetric.extractPath(0.0, pathMetric.length * progress);
      canvas.drawPath(extractPath, _paint);
    }

    var pathForLetterE = createPathForE(size.width, size.height);
    PathMetrics pathMetricsForE = pathForLetterE.computeMetrics();
    for (PathMetric pathMetric in pathMetricsForE) {
      Path extractPath =
          pathMetric.extractPath(0.0, pathMetric.length * progress);
      canvas.drawPath(extractPath, _paint);
    }

    var pathForLetterR = createPathForR(size.width, size.height);
    PathMetrics pathMetricsForR = pathForLetterR.computeMetrics();
    for (PathMetric pathMetric in pathMetricsForR) {
      Path extractPath =
          pathMetric.extractPath(0.0, pathMetric.length * progress);
      canvas.drawPath(extractPath, _paint);
    }

    var pathForLetterR1 = createPathForR1(size.width, size.height);
    PathMetrics pathMetricsForR1 = pathForLetterR1.computeMetrics();
    for (PathMetric pathMetric in pathMetricsForR1) {
      Path extractPath =
          pathMetric.extractPath(0.0, pathMetric.length * progress);
      canvas.drawPath(extractPath, _paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

  Path createPathForF(double width, double height) {
    Path path = Path();
    double x = width / 15;
    double y = height / 3;

    path.moveTo(x, y);
    path.lineTo(x, y - 80);
    path.lineTo(x + 60, y - 80);
    path.lineTo(x + 60, y - 70);
    path.lineTo(x + 10, y - 70);
    path.lineTo(x + 10, y - 50);
    path.lineTo(x + 50, y - 50);
    path.lineTo(x + 50, y - 40);
    path.lineTo(x + 10, y - 40);
    path.lineTo(x + 10, y);
    path.lineTo(x, y);
    return path;
  }

  Path createPathForL(double width, double height) {
    Path path = Path();
    double x = width / 15 + 70;
    double y = height / 3;

    path.moveTo(x, y);
    path.lineTo(x, y - 80);
    path.lineTo(x + 10, y - 80);
    path.lineTo(x + 10, y - 10);
    path.lineTo(x + 50, y - 10);
    path.lineTo(x + 50, y);
    path.lineTo(x, y);
    return path;
  }

  Path createPathForU(double width, double height) {
    Path path = Path();
    double x = width / 15 + 130;
    double y = height / 3;

    path.moveTo(x, y - 20);
    path.lineTo(x, y - 80);
    path.lineTo(x + 10, y - 80);
    path.lineTo(x + 10, y - 20);
    path.cubicTo(x + 10, y - 20, x + 25, y, x + 40, y - 20);
    path.lineTo(x + 40, y - 80);
    path.lineTo(x + 50, y - 80);
    path.lineTo(x + 50, y - 20);
    path.cubicTo(x + 50, y - 20, x + 25, y + 20, x, y - 20);
    return path;
  }

  Path createPathForT(double width, double height) {
    Path path = Path();
    double x = width / 15 + 190;
    double y = height / 3;

    path.moveTo(x, y - 80);
    path.lineTo(x + 60, y - 80);
    path.lineTo(x + 60, y - 70);
    path.lineTo(x + 35, y - 70);
    path.lineTo(x + 35, y);
    path.lineTo(x + 25, y);
    path.lineTo(x + 25, y - 70);
    path.lineTo(x, y - 70);
    path.lineTo(x, y - 80);
    return path;
  }

  Path createPathForT1(double width, double height) {
    Path path = Path();
    double x = width / 15 + 260;
    double y = height / 3;

    path.moveTo(x, y - 80);
    path.lineTo(x + 60, y - 80);
    path.lineTo(x + 60, y - 70);
    path.lineTo(x + 35, y - 70);
    path.lineTo(x + 35, y);
    path.lineTo(x + 25, y);
    path.lineTo(x + 25, y - 70);
    path.lineTo(x, y - 70);
    path.lineTo(x, y - 80);
    return path;
  }

  Path createPathForE(double width, double height) {
    Path path = Path();
    double x = width / 15 + 330;
    double y = height / 3;

    path.moveTo(x, y);
    path.lineTo(x, y - 80);
    path.lineTo(x + 60, y - 80);
    path.lineTo(x + 60, y - 70);
    path.lineTo(x + 10, y - 70);
    path.lineTo(x + 10, y - 50);
    path.lineTo(x + 50, y - 50);
    path.lineTo(x + 50, y - 40);
    path.lineTo(x + 10, y - 40);
    path.lineTo(x + 10, y - 10);
    path.lineTo(x + 60, y - 10);
    path.lineTo(x + 60, y);
    path.lineTo(x, y);
    return path;
  }

  Path createPathForR(double width, double height) {
    Path path = Path();
    double x = width / 15 + 400;
    double y = height / 3;

    path.moveTo(x, y);
    path.lineTo(x, y - 80);
    path.lineTo(x + 40, y - 80);
    path.quadraticBezierTo(x + 60, y - 60, x + 40, y - 35);
    path.lineTo(x + 60, y);
    path.lineTo(x + 50, y);
    path.lineTo(x + 30, y - 35);
    path.lineTo(x + 10, y - 35);
    path.lineTo(x + 10, y);
    path.lineTo(x, y);
    return path;
  }

  Path createPathForR1(double width, double height) {
    Path path = Path();
    double x = width / 15 + 400;
    double y = height / 3;

    path.moveTo(x+10, y-70);
    path.lineTo(x+30, y - 70);
    path.quadraticBezierTo(x + 45, y - 60, x + 30, y - 45);
    path.lineTo(x + 10, y-45);
    path.lineTo(x+10, y-70);
    return path;
  }
}
