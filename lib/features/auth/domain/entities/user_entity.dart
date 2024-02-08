import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String email;
  final String name;
  final String lastName;
  final String password;

  const UserEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.lastName,
    required this.password,
  });

  @override
  List<Object?> get props => [id, email, name, lastName, password];
}
