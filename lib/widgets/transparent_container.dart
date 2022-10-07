import 'package:flutter/material.dart';

class TransparentContainer extends StatelessWidget {
  final Widget widget;
  const TransparentContainer({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white.withOpacity(0.5)),
      child: widget,
    );
  }
}
