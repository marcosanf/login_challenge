import 'package:login_challenge/features/auth/data/datasources/auth_datasource.dart';
import 'package:login_challenge/features/auth/domain/entities/user_entity.dart';
import 'package:login_challenge/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthDataSource authDatasource;

  AuthRepositoryImp(this.authDatasource);

  @override
  Future<UserEntity> login(String email, String password) async {
    return authDatasource.login(email, password);
  }

  @override
  Future<void> register(UserEntity user) async {
    return authDatasource.register(user);
  }
}
