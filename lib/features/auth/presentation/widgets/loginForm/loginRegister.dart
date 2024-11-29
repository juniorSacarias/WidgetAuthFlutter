import 'package:coffe_menu/cores/widgets/textWidget.dart';
import 'package:flutter/material.dart';

/// A stateless widget that displays a login/register form.
///
/// This widget adapts its layout based on the screen size. For large screens,
/// it shows a text prompt and a button to create an account. For smaller screens,
/// it shows a text button with the same prompt.
///
/// The button's font size and other styling properties are adjusted based on the screen size.
///
/// The widget uses the `TextWidget` for displaying text and `ElevatedButton` or `TextButton`
/// for the action button, depending on the screen size.
///
/// The `isLargeScreen` boolean determines if the screen width is greater than 700 pixels.
///
/// The `buttonFontSize` is set to 18 for large screens and 12 for smaller screens.
class LoginRegister extends StatelessWidget {
  const LoginRegister({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLargeScreen = MediaQuery.of(context).size.width > 700;
    double buttonFontSize = isLargeScreen ? 18 : 12;
    return Column(
      children: [
        if (isLargeScreen) ...[
          TextWidget(
            text: "Don't have an account? Create one!",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w200,
              fontSize: buttonFontSize,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 240,
            height: 46,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(254, 233, 170, 1),
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: TextWidget(
                text: 'Create Account',
                style: TextStyle(
                    fontSize: buttonFontSize,
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ] else ...[
          TextButton(
            onPressed: () {},
            child: TextWidget(
              text: "Don't have an account? Create one!",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w200,
                fontSize: buttonFontSize,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
