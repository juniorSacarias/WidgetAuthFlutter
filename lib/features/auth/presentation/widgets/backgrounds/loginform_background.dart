import 'package:coffe_menu/cores/widgets/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:coffe_menu/features/auth/presentation/widgets/loginForm/login_form.dart';
import 'package:coffe_menu/features/appClient/domain/entities/appclient_entities.dart';

class FondoLoginForm extends StatelessWidget {
  final bool isLargeScreen;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final AppclientEntities client;

  const FondoLoginForm({
    super.key,
    required this.isLargeScreen,
    required this.usernameController,
    required this.passwordController,
    required this.client,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (isLargeScreen)
          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            width: MediaQuery.of(context).size.width >= 900
                ? 600
                : MediaQuery.of(context).size.width > 600
                    ? 500
                    : MediaQuery.of(context).size.width,
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(252, 211, 129, 1),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(107),
                  topLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  bottomLeft: Radius.circular(0),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  LoginForm(
                    usernameController: usernameController,
                    passwordController: passwordController,
                    userName: client.appTitle,
                  ),
                ],
              ),
            ),
          )
        else
          Positioned(
            top: MediaQuery.of(context).size.height / 2.5,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(252, 211, 129, 1),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(107),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  LoginForm(
                    usernameController: usernameController,
                    passwordController: passwordController,
                    userName: client.appTitle,
                  ),
                ],
              ),
            ),
          ),
        // Contenido
        Column(
          children: [
            const SizedBox(height: 30),
            if (isLargeScreen)
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 70, left: 600),
                  child: LogoWidget(
                    imagePath: client.imageLink,
                    width: 155,
                    height: 155,
                  ),
                ),
              )
            else
              Column(
                children: [
                  const SizedBox(height: 50),
                  Center(
                    child: LogoWidget(
                      imagePath: client.imageLink,
                      width: 155,
                      height: 155,
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 50),
          ],
        ),
      ],
    );
  }
}