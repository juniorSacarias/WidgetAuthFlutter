import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coffe_menu/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

class AuthStateHandler extends StatelessWidget {
  const AuthStateHandler({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
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
            description: const Text('Error in login please try again'),
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
    );
  }
}
