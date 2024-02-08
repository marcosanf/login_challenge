import 'package:login_challenge/features/auth/data/datasources/auth_datasource.dart';
import 'package:login_challenge/features/auth/data/repositories/auth_repository.dart';
import 'package:login_challenge/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

import '../features/auth/domain/repositories/auth_repository.dart';

class DependencyInjection {
  static final GetIt sl = GetIt.instance;

  static void setup() {
    sl.registerLazySingleton<AuthDataSource>(() => AuthLocalDataSourceImpl());

    sl.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImp(sl<AuthDataSource>()));

    sl.registerFactory<AuthCubit>(() => AuthCubitImp(sl<AuthRepository>()));
  }
}
