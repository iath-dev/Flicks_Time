import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: CustomPaint(
        painter: _CustomBackgroundPaint(theme: theme),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Center(
                  child: Pulse(
                    // infinite: true,
                    duration: Durations.extralong4,
                    onFinish: (direction) =>
                        Navigator.pushReplacementNamed(context, 'home'),
                    child: Image.asset(
                      'assets/popcorn-pana.png',
                      fit: BoxFit.fitHeight,
                      height: 240.0,
                    ),
                  ),
                ),
              ),
              Image.asset(
                'assets/tmdb_logo.png',
                fit: BoxFit.fitHeight,
                height: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomBackgroundPaint extends CustomPainter {
  final ThemeData theme;

  _CustomBackgroundPaint({super.repaint, required this.theme});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = theme.colorScheme.primary.withOpacity(.25)
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;

    final path = Path();

    // Top
    // path.lineTo(0, size.height * .5);
    // path.quadraticBezierTo(size.width * .25, size.height * .30, size.width * .5,
    //     size.height * .25);
    // path.quadraticBezierTo(
    //     size.width * .75, size.height * .20, size.width, size.height * .25);
    // path.lineTo(size.width, size.height * .25);
    // path.lineTo(size.width, 0);

    // Bottom
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * .95);
    path.quadraticBezierTo(
        size.width * .25, size.height * .85, size.width * .5, size.height * .9);
    path.quadraticBezierTo(
        size.width * .85, size.height * .95, size.width, size.height * .9);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
