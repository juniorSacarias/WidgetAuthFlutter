import 'package:flutter/material.dart';

/// A custom input text widget that provides a styled [TextField] with optional
/// controller, hint text, and input type.
///
/// The [InputTextWidget] allows for customization of the text field's
/// controller, hint text, and input type. If the input type is set to 'password',
/// the text field will obscure the text for password input.
///
/// The widget includes custom styling for the text field, including cursor color,
/// text alignment, background color, border styling, and content padding.
///
/// Example usage:
/// ```dart
/// InputTextWidget(
///   controller: myController,
///   hintText: 'Enter your text',
///   type: 'password',
/// )
/// ```
///
/// Parameters:
/// - [controller]: An optional [TextEditingController] to control the text being edited.
/// - [hintText]: An optional string to display as a hint in the text field.
/// - [type]: An optional string to specify the input type. If set to 'password',
///   the text field will obscure the text.
class InputTextWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? type;

  const InputTextWidget({
    super.key,
    this.controller,
    this.hintText,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: Colors.black,
      textAlign: TextAlign.left,
      obscureText: type == 'password',
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: const Color.fromRGBO(255, 255, 211, 1),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      ),
    );
  }
}
