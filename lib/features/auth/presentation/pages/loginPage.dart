import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coffe_menu/cores/widgets/logoWidget.dart';
import 'package:coffe_menu/features/auth/presentation/widgets/loginForm/loginForm.dart';
import 'package:coffe_menu/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:coffe_menu/features/auth/presentation/pages/HomePage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/// A `StatelessWidget` that represents the login page of the application.
/// 
/// This widget contains the following components:
/// - A background container with a specific color.
/// - A login form that adjusts its layout based on the screen size.
/// - A logo widget that is positioned differently based on the screen size.
/// - A `BlocConsumer` that listens to authentication state changes and displays notifications accordingly.
/// 
/// The `LoginPage` uses the following controllers:
/// - `usernameController`: A `TextEditingController` for the username input field.
/// - `passwordController`: A `TextEditingController` for the password input field.
/// 
/// The `LoginPage` also includes:
/// - `logoAhamatic`: A string representing the path to the logo image.
/// 
/// The `build` method constructs the UI using a `Scaffold` and a `LayoutBuilder` to handle different screen sizes.
class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final logoAhamatic = 'assets/images/ahamaticLogo.png';

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isLargeScreen = constraints.maxWidth > 700;
          return Stack(
            children: [
              // Fondo principal
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration:
                    const BoxDecoration(color: Color.fromRGBO(240, 160, 45, 1)),
              ),
              // Fondo del LoginForm
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
                          imagePath: logoAhamatic,
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
                            imagePath: logoAhamatic,
                            width: 155,
                            height: 155,
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 50),
                ],
              ),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthAuthenticated) {
                    ElegantNotification.success(
                      title: const Text("Login successful"),
                      description: const Text("You are now logged in"),
                      displayCloseButton: false,
                    ).show(context);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  } else if (state is AuthError) {
                    ElegantNotification.error(
                      title: const Text("Login error"),
                      description:
                          const Text('Error in login please try again'),
                      displayCloseButton: false,
                    ).show(context);
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const Center(
                      child: SpinKitFadingCircle(
                        color: Colors.black,
                        size: 50.0,
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
