import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirsal/constants.dart';
import 'dart:math' as math;

class DiamondButton extends StatelessWidget {
  final double size;
  final Color color;
  final Color borderColor;
  final double borderWidth;
  final Widget child;
  final VoidCallback onTap;

  const DiamondButton({
    super.key, 
    required this.size,
    required this.color,
    required this.borderColor,
    required this.borderWidth,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.rotate(
            angle: 45 * math.pi / 180,
            child: ClipPath(
              clipper: DiamondClipper(),
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20.w),
                  border: Border.all(
                    color: kWhiteColor,
                    width: 10.w,
                  )
                ),
                width: size - borderWidth,
                height: size - borderWidth,
                child: Center(
                  child: child,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DiamondClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double width = size.width;
    final double height = size.height;
    const double radius = 8;

    final Path path = Path()
      ..moveTo(radius, 0)
      ..lineTo(width - radius, 0)
      ..arcToPoint(Offset(width, radius), radius: const Radius.circular(radius))
      ..lineTo(width, height - radius)
      ..arcToPoint(Offset(width - radius, height), radius: const Radius.circular(radius))
      ..lineTo(radius, height)
      ..arcToPoint(Offset(0, height - radius), radius: const Radius.circular(radius))
      ..lineTo(0, radius)
      ..arcToPoint(const Offset(radius, 0), radius: const Radius.circular(radius))
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class DiamondBorderPainter extends CustomPainter {
  final Color borderColor;
  final double borderWidth;

  DiamondBorderPainter({required this.borderColor, required this.borderWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = borderColor
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;

    final Path path = DiamondClipper().getClip(size);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}