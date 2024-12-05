import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coffe_menu/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = GoRouterState.of(context).extra as AuthState?;

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final currentState = authState ?? state;
        if (currentState is AuthAuthenticated) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () {
                    context.read<AuthBloc>().add(LogoutRequested());
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      GoRouter.of(context).go('/');
                    });
                  },
                ),
              ],
            ),
            body: const Center(
              child: Text(
                'HomePage',
                style: TextStyle(fontSize: 24),
              ),
            ),
          );
        } else {
          // Redirigir a la página de inicio de sesión si no está autenticado
          WidgetsBinding.instance.addPostFrameCallback((_) {
            GoRouter.of(context).go('/');
          });
          return const SizedBox.shrink();
        }
      },
    );
  }
}
