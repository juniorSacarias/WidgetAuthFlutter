import 'package:coffe_menu/cores/error/page/error_page.dart';
import 'package:coffe_menu/cores/notFound/notfound.dart';
import 'package:coffe_menu/features/auth/presentation/pages/home_page.dart';
import 'package:coffe_menu/features/auth/presentation/pages/login_page.dart';
import 'package:go_router/go_router.dart';
import 'package:coffe_menu/features/auth/presentation/bloc/auth_bloc.dart'; 

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/client/:clientName',
      builder: (context, state) {
        final clientName = state.pathParameters['clientName'];
        return LoginPage(clientName: clientName);
      },
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/error',
      builder: (context, state) => const ErrorPage(),
    ),
  ],
  errorBuilder: (context, state) => const NotFoundPage(),
  redirect: (context, state) {
    if (state.uri.toString() == '/') {
      return '/client/default';
    }
    if (state.uri.toString() == '/home' && !isAuthenticated) {
      return '/error';
    }
    return null; // No redirige en otros casos
  },
);
