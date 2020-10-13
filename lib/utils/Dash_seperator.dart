import 'package:flutter/material.dart';


class MySeparator extends StatelessWidget {
  final double height;
  final Color color;
  final bool Horizontal;

  const MySeparator({this.height , this.color ,this.Horizontal});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = Horizontal==true?constraints.constrainWidth():constraints.constrainHeight();
        final dashWidth = 2.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: Horizontal==true?dashWidth:dashHeight,
              height: Horizontal==true?dashHeight:dashWidth,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction:Horizontal==true?Axis.horizontal: Axis.vertical,
        );
      },
    );
  }
}