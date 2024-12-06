import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Signinfacebook extends StatelessWidget {
  const Signinfacebook({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {
          // Acción del botón
        },
        icon: SvgPicture.asset(
          'assets/images/facebookLogo.svg',
          width: 24,
          height: 24,
        ),
        label: const Text('Sign in with Facebook'),
      ),
    );
  }
}
