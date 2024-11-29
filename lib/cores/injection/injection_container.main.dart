part of 'injection_container.dart';

/// Sets up the dependency injection container using the GetIt package.
/// 
/// This function registers various services and dependencies as lazy singletons
/// or factories, including:
/// 
/// - Dio: A powerful HTTP client for Dart.
/// - AuthDatasource: A data source for authentication, implemented by AuthRemoteDataSourceImpl.
/// - AuthRepositories: A repository for authentication, implemented by AuthRepositoryImpl.
/// - LoginUseCase: A use case for handling login logic.
/// - AuthBloc: A Bloc for managing authentication state.
/// 
/// These dependencies are registered in the GetIt instance, allowing them to be
/// easily accessed and injected throughout the application.
final getIt = GetIt.instance;

void setup() {
  // Register Dio
  getIt.registerLazySingleton<Dio>(
    () => Dio(),
  );

  // Datasources
  getIt.registerLazySingleton<AuthDatasource>(
    () => AuthRemoteDataSourceImpl(getIt<Dio>()),
  );

  // Repositories
  getIt.registerLazySingleton<AuthRepositories>(
    () => AuthRepositoryImpl(getIt<AuthDatasource>()),
  );

  // Use cases
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(getIt<AuthRepositories>()),
  );

  // Blocs
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(loginUseCase: getIt<LoginUseCase>()),
  );
}
