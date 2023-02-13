import 'package:flutter/material.dart';
import 'package:uidesign/utils/constants.dart';

class BorderIcon extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double width, height;

  const BorderIcon(this.child, this.padding, this.width, this.height,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: COLOR_WHITE,
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          border: Border.all(color: COLOR_GREY.withOpacity(40), width: 2)),
      padding: const EdgeInsets.all(8.0),
      child: Center(child: child),
    );
  }
}