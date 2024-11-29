import 'package:coffe_menu/cores/widgets/textWidget.dart';
import 'package:coffe_menu/features/auth/presentation/widgets/SignInWithGoogle/signinGoogle.dart';
import 'package:coffe_menu/features/auth/presentation/widgets/loginForm/loginButton.dart';
import 'package:coffe_menu/features/auth/presentation/widgets/loginForm/loginInput.dart';
import 'package:coffe_menu/features/auth/presentation/widgets/loginForm/loginRegister.dart';
import 'package:flutter/material.dart';

/// A stateless widget that represents a login form.
///
/// This widget contains input fields for username and password, a login button,
/// and options for social login and registration. The layout adapts based on the
/// screen size, displaying additional elements for larger screens.
///
/// The [usernameController] and [passwordController] are required to manage the
/// input fields for username and password respectively.
///
/// The widget uses a [Padding] widget to add horizontal padding and a [Container]
/// to set a fixed width and transparent background. The [LayoutBuilder] is used
/// to adapt the layout based on the screen size.
///
/// The layout includes:
/// - A title text 'AhaStudio' for large screens.
/// - [LoginInput] widget for username and password input fields.
/// - [LoginButton] widget for the login button.
/// - [LoginRegister] widget for registration options, displayed differently based
///   on the screen size.
/// - [Signingoogle] widget for Google sign-in option.
///
/// The layout adjusts the spacing between elements based on the screen size.

class LoginForm extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const LoginForm({
    super.key,
    required this.usernameController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: 300,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isLargeScreen = MediaQuery.of(context).size.width > 700;
            double separator = isLargeScreen ? 50 : 30;
            return Column(
              children: [
                if (isLargeScreen) ...[
                  const SizedBox(height: 50),
                  const TextWidget(
                    text: 'AhaStudio',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
                LoginInput(
                  usernameController: usernameController,
                  passwordController: passwordController,
                ),
                SizedBox(height: separator),
                LoginButton(
                  usernameController: usernameController,
                  passwordController: passwordController,
                ),
                const SizedBox(height: 5),
                if (!isLargeScreen) const LoginRegister(),
                SizedBox(height: separator),
                const Column(
                  children: [
                    Signingoogle(),
                    // If need more social login buttons, uncomment the next line
                    /*SizedBox(height: 10),
                    Signinfacebook(),*/
                  ],
                ),
                if (isLargeScreen) ...[
                  SizedBox(height: separator),
                  const LoginRegister(),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
