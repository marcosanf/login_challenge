import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';

part 'auth_state.dart';

abstract class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  Future<void> register(UserEntity user);
}

class AuthCubitImp extends AuthCubit {
  final AuthRepository _authRepository;

  AuthCubitImp(this._authRepository) : super();

  @override
  Future<void> register(UserEntity user) async {
    try {
      await _authRepository.register(user);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(
        const AuthError(
            'An error occurred while trying to register the user. Please try again.'),
      );
    }
  }
}
