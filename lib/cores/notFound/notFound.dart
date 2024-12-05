import 'package:coffe_menu/cores/widgets/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFA726), // Fondo naranja
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
              text: "Wow it seems the route doesn't exist",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.normal,
                fontFamily: 'Montserrat',
                color: Colors.black,
              ),
            ),
            // Botón
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 225, // Ancho del botón
              height: 35, // Altura del botón
              child: ElevatedButton(
                onPressed: () {
                  // Redirigir a la página de inicio
                  context.go('/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFE082),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                ),
                child: const TextWidget(
                  text: 'Go Home',
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
