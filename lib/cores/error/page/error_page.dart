import 'package:coffe_menu/cores/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultClient = dotenv.env['DEFAULT_CLIENT'];

    return Scaffold(
      backgroundColor: const Color(0xFFFFA726), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icono de advertencia
            SvgPicture.asset(
              'assets/images/errorIcon.svg',
              height: 85,
              width: 85,
            ),
            const SizedBox(height: 30),
            // Texto principal
            const TextWidget(
              text: 'Invalid route',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.normal,
                fontFamily: 'Montserrat',
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextWidget(
                text:
                    'Please enter a url in the path or use the button to access the default client',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 50),
            // Botón
            SizedBox(
              width: 225, // Ancho del botón
              height: 35, // Altura del botón
              child: ElevatedButton(
                onPressed: () {
                  // Redirigir al cliente predeterminado
                  context.go('/client/$defaultClient');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFE082),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                ),
                child: const TextWidget(
                  text: 'Default client',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Montserrat',
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
