import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_challenge/core/dependency_injection.dart';
import 'package:login_challenge/features/auth/data/datasources/auth_datasource.dart';
import 'package:login_challenge/features/auth/presentation/cubit/auth_cubit.dart';
import 'features/auth/data/repositories/auth_repository.dart';
import 'features/auth/presentation/pages/auth_login_page.dart';

void main() {
  DependencyInjection.setup();
  runApp(
    BlocProvider<AuthCubit>(
      create: (context) => AuthCubitImp(
        AuthRepositoryImp(
          AuthLocalDataSourceImpl(),
        ),
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BlocProvider(
        create: (context) => AuthCubitImp(
          AuthRepositoryImp(
            AuthLocalDataSourceImpl(),
          ),
        ),
        child: const AuthLoginPage(),
      ),
    );
  }
}
