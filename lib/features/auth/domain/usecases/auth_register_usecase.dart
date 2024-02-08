import 'package:login_challenge/features/auth/domain/entities/user_entity.dart';

import '../repositories/auth_repository.dart';

class AuthRegisterUseCase {
  final AuthRepository _authRepository;

  AuthRegisterUseCase(this._authRepository);

  Future<void> register(UserEntity user) async {
    return await _authRepository.register(user);
  }
}
