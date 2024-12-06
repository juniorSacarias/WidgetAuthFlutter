import 'package:coffe_menu/features/auth/domain/usecases/auth_usecases.dart';
import 'package:coffe_menu/features/appClient/domain/useCases/appClientName_useCases.dart';
import 'package:coffe_menu/features/auth/presentation/widgets/backgrounds/loginformBackground.dart';
import 'package:coffe_menu/features/auth/presentation/widgets/backgrounds/primaryBackgroun.dart';
import 'package:coffe_menu/features/auth/presentation/widgets/stateController/authState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                const FondoPrincipal(),
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
                      return FondoLoginForm(
                        isLargeScreen: isLargeScreen,
                        usernameController: usernameController,
                        passwordController: passwordController,
                        client: client,
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
                      ),
                    );
                  },
                ),
                const AuthStateHandler(),
              ],
            );
          },
        ),
      ),
    );
  }
}
