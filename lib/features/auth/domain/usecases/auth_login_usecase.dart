import 'package:login_challenge/features/auth/domain/entities/user_entity.dart';
import 'package:login_challenge/features/auth/domain/repositories/auth_repository.dart';

class AuthLoginUseCase {
  final AuthRepository repository;

  AuthLoginUseCase(this.repository);

  Future<UserEntity> execute(String email, String password) async {
    return repository.login(email, password);
  }
}
