import 'package:coffe_menu/features/auth/domain/usecases/auth_usecases.dart';
import 'package:coffe_menu/features/appClient/domain/useCases/appClientName_useCases.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coffe_menu/cores/widgets/logoWidget.dart';
import 'package:coffe_menu/features/auth/presentation/widgets/loginForm/loginForm.dart';
import 'package:coffe_menu/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final String? clientName; // nombre desde el parámetro uri

  LoginPage({super.key, this.clientName});

  @override
  Widget build(BuildContext context) {
    final appTitle = clientName ?? '';

    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthBloc(
          loginUseCase: GetIt.instance<LoginUseCase>(),
          appclientnameUsecases: GetIt.instance<AppclientnameUsecases>(),
        )..add(FetchClientData(appTitle)),
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isLargeScreen = constraints.maxWidth > 700;
            return Stack(
              children: [
                // Fondo principal
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(240, 160, 45, 1)),
                ),
                // Fondo del LoginForm
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is ClientDataLoaded) {
                      final client = state.client;
                      if (client.appTitle.isEmpty) {
                        // Redirigir a la página de error si el cliente no se encuentra
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          GoRouter.of(context).go('/error');
                        });
                        return Container();
                      }
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
                                    padding: const EdgeInsets.only(
                                        top: 70, left: 600),
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
                    } else if (state is AuthLoading) {
                      return const Center(
                        child: SpinKitFadingCircle(
                          color: Colors.black,
                          size: 50.0,
                        ),
                      );
                    } else if (state is AuthError) {
                      // Redirigir a la página de error si hay un error de autenticación
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        GoRouter.of(context).go('/error');
                      });
                      return Container();
                    }
                    return Positioned(
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
                    );
                  },
                ),
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthAuthenticated) {
                      ElegantNotification.success(
                        title: const Text("Login successful"),
                        description: const Text("You are now logged in"),
                        displayCloseButton: false,
                      ).show(context);

                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        GoRouter.of(context).go('/home', extra: state);
                      });
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
      ),
    );
  }
}
