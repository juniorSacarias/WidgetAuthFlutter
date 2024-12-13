import 'package:coffe_menu/cores/widgets/text_widget.dart';
import 'package:coffe_menu/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// A custom `LoginButton` widget that displays a sign-in button.
///
/// This widget takes two required parameters:
/// - `usernameController`: A [TextEditingController] for the username input field.
/// - `passwordController`: A [TextEditingController] for the password input field.
///
/// When the button is pressed, it checks if both the username and password fields
/// are not empty. If they are not empty, it triggers a `LoginRequested` event
/// with the provided username and password. If either field is empty, it shows
/// an informational notification indicating that both fields are required.
///
/// The button's appearance adapts based on the screen size, adjusting the font size
/// for larger screens. The button is styled with a custom background color, elevation,
/// and rounded corners.
///
/// Example usage:
///
/// ```dart
/// LoginButton(
///   usernameController: _usernameController,
///   passwordController: _passwordController,
/// )
/// ```
class LoginButton extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const LoginButton({
    super.key,
    required this.usernameController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    bool isLargeScreen = MediaQuery.of(context).size.width > 700;
    double buttonFontSize = isLargeScreen ? 20 : 16;

    return SizedBox(
      width: 240,
      height: 46,
      child: ElevatedButton(
        onPressed: () {
          final username = usernameController.text.trim();
          final password = passwordController.text.trim();
          final apiKey = dotenv.get('API_KEY');

          if (username.isNotEmpty && password.isNotEmpty) {
            context.read<AuthBloc>().add(
                  LoginRequested(username, password, apiKey),
                );
          } else {
            ElegantNotification.info(
              title: const Text("Username and password are required"),
              description: const Text('All the fields are required'),
              displayCloseButton: false,
            ).show(context);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(254, 233, 170, 1),
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: TextWidget(
          text: 'Sign in',
          style: TextStyle(
              fontSize: buttonFontSize,
              color: Colors.black,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
