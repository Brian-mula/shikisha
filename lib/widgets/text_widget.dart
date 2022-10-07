import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  const TextWidget({super.key, required this.text, this.textStyle});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Text(
      text,
      style: textStyle ?? theme.textTheme.bodySmall,
    );
  }
}
