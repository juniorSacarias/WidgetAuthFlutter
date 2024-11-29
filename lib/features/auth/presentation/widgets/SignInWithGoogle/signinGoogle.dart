import 'package:coffe_menu/cores/widgets/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A stateless widget that displays a "Sign in with Google" button.
///
/// The button's size and text style adapt based on the screen width.
///
/// - On large screens (width > 600):
///   - Button width: 314
///   - Button height: 48
///   - Icon size: 34x34
///   - Text font size: 16
///
/// - On smaller screens:
///   - Button width: null (default)
///   - Button height: null (default)
///   - Icon size: 24x24
///   - Text font size: null (default)
///
/// The button uses an SVG asset for the Google logo and a custom text widget for the label.
///
/// The button's onPressed callback is currently empty and should be implemented to handle the sign-in action.
class Signingoogle extends StatelessWidget {
  const Signingoogle({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLargeScreen = MediaQuery.of(context).size.width > 600;
    double? widthContainer = isLargeScreen ? 314 : null;
    double? heightContainer = isLargeScreen ? 48 : null;
    double? widthIcon = isLargeScreen ? 34 : 24;
    double? heightIcon = isLargeScreen ? 34 : 24;
    double? forntSizeText = isLargeScreen ? 16 : null;

    return Center(
      child: SizedBox(
        width: widthContainer,
        height: heightContainer,
        child: ElevatedButton.icon(
          onPressed: () {
            // Acción del botón
          },
          icon: SvgPicture.asset(
            'assets/images/googleLogo.svg',
            width: widthIcon,
            height: heightIcon,
          ),
          label: TextWidget(
            text: 'Sign in with Google',
            style: TextStyle(
              fontSize: forntSizeText,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
      ),
    );
  }
}
