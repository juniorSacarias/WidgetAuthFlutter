import 'package:coffe_menu/cores/widgets/inputTextWidget.dart';
import 'package:coffe_menu/cores/widgets/textWidget.dart';
import 'package:flutter/material.dart';

/// A stateless widget that represents a login input form with username and password fields.
///
/// The widget adjusts its layout based on the screen size. For larger screens, it uses larger
/// input fields and font sizes.
///
/// The [LoginInput] widget requires two [TextEditingController]s to manage the input for
/// the username and password fields.
///
/// Example usage:
///
/// ```dart
/// LoginInput(
///   usernameController: _usernameController,
///   passwordController: _passwordController,
/// )
/// ```
///
/// The widget contains:
/// - A text label for the username field.
/// - A text input field for the username.
/// - A text label for the password field.
/// - A text input field for the password, with the input type set to 'password'.
///
/// The layout and styling of the input fields and labels are adjusted based on the screen width.
class LoginInput extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const LoginInput({
    super.key,
    required this.usernameController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    bool isLargeScreen = MediaQuery.of(context).size.width > 700;
    double inputWidth = isLargeScreen ? 350 : 250;
    double inputFontSize = isLargeScreen ? 24 : 19;
    double separatorMin = isLargeScreen ? 10 : 5;
    double separatorMax = isLargeScreen ? 30 : 24;

    return Column(
      children: [
        SizedBox(
          width: 250,
          height: 30,
          child: Center(
            child: TextWidget(
              text: 'Username',
              style: TextStyle(
                fontSize: inputFontSize,
                fontWeight: FontWeight.w800,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
        ),
        SizedBox(height: separatorMin),
        SizedBox(
          width: inputWidth,
          height: 37,
          child: InputTextWidget(
            controller: usernameController,
          ),
        ),
        SizedBox(height: separatorMax),
        SizedBox(
          width: 250,
          height: 30,
          child: Center(
            child: TextWidget(
              text: 'Password',
              style: TextStyle(
                fontSize: inputFontSize,
                fontWeight: FontWeight.w800,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
        ),
        SizedBox(height: separatorMin),
        SizedBox(
          width: inputWidth,
          height: 37,
          child: InputTextWidget(
            controller: passwordController,
            type: 'password',
          ),
        ),
      ],
    );
  }
}
