import 'package:coffe_menu/cores/injection/injection_container.dart';
import 'package:coffe_menu/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:coffe_menu/features/auth/presentation/pages/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// The main entry point of the application.
/// 
/// This function sets up the necessary configurations, loads environment variables,
/// and initializes the application with a `BlocProvider` for the `AuthBloc`.
/// 
/// The `runApp` function is called with `MyApp` as the root widget.
void main() async {
  setup(); 
  await dotenv.load(fileName: ".env"); 
  runApp(
    BlocProvider(
      create: (_) => getIt<AuthBloc>(), 
      child: const MyApp(),
    ),
  );
}

/// The root widget of the application.
/// 
/// This widget is a stateless widget that builds a `MaterialApp` with a custom theme
/// and sets the `LoginPage` as the home screen.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(),
    );
  }
}
