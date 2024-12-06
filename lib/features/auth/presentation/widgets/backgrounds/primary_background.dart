import 'package:flutter/material.dart';

class FondoPrincipal extends StatelessWidget {
  const FondoPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(240, 160, 45, 1),
      ),
    );
  }
}