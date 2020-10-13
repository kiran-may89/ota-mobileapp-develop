import 'package:flutter/material.dart';


class DolDurmaClipper extends CustomClipper<Path> {
  DolDurmaClipper({@required this.top, @required this.holeRadius});


  final double top;
  final double holeRadius;


  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo( 0.0,size.height - top - holeRadius)
      ..arcToPoint(
        Offset( 0,size.height - top),
        clockwise: true,
        radius: Radius.circular(1),
      )
      ..lineTo( 0.0,size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, size.height - top)
      ..arcToPoint(
        Offset(size.width, size.height - top - holeRadius),
        clockwise: true,
        radius: Radius.circular(1),
      );

    path.lineTo(size.width,0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(DolDurmaClipper oldClipper) => true;

//  static double getHeight(GlobalKey<State<StatefulWidget>> key) {
//    final keyContext = key.currentContext;
//    final box = keyContext.findRenderObject() as RenderBox;
//    final pos = box.localToGlobal(Offset.zero);
//    return pos.dy/2;
//  }
}

//final path = Path()
//  ..moveTo(0, 0)
//  ..lineTo(size.width - right - holeRadius, 0.0)
//  ..arcToPoint(
//    Offset(size.width - right, 0),
//    clockwise: false,
//    radius: Radius.circular(1),
//  )
//  ..lineTo(size.width, 0.0)
//  ..lineTo(size.width, size.height)
//  ..lineTo(size.width - right, size.height)
//  ..arcToPoint(
//    Offset(size.width - right - holeRadius, size.height),
//    clockwise: false,
//    radius: Radius.circular(1),
//  );
//
//path.lineTo(0.0, size.height);
//
//path.close();
//return path;