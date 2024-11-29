import 'package:flutter/material.dart';

/// A stateless widget that displays a text with an optional style.
///
/// The [TextWidget] takes a required [text] parameter and an optional [style]
/// parameter. If no style is provided, it defaults to the [DefaultTextStyle]
/// of the current [BuildContext].
///
/// Example usage:
/// ```dart
/// TextWidget(
///   text: 'Hello, World!',
///   style: TextStyle(fontSize: 20, color: Colors.blue),
/// )
/// ```
///
/// The [text] parameter must not be null.
class TextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const TextWidget({
    super.key,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? DefaultTextStyle.of(context).style,
    );
  }
}