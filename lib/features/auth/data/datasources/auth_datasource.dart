import 'dart:convert';

import '../../domain/entities/user_entity.dart';
import 'package:http/http.dart' as http;

abstract class AuthDataSource {
  Future<UserEntity> login(String email, String password);
  Future<void> register(UserEntity user);
}

class AuthLocalDataSourceImpl implements AuthDataSource {
  final String baseUrl = 'https://65c432d1dae2304e92e25d29.mockapi.io/api/v1';
  AuthLocalDataSourceImpl();

  @override
  Future<UserEntity> login(String email, String password) async {
    final response = await http.post(Uri.parse('$baseUrl/login'), body: {
      'email': email,
      'password': password
    }, headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      final userData = jsonDecode(response.body);
      return UserEntity(
        id: userData['id'],
        email: userData['email'],
        password: userData['password'],
        name: userData['name'],
        lastName: userData['lastName'],
      );
    } else {
      throw Exception('Failed to login');
    }
  }

  @override
  Future<void> register(UserEntity user) async {
    final response = await http.post(Uri.parse('$baseUrl/users'),
        body: json.encode(
          {
            'email': user.email,
            'password': user.password,
            'name': user.name,
            'lastName': user.lastName,
          },
        ),
        headers: {
          'Content-Type': 'application/json',
        });

    if (response.statusCode != 201) {
      throw Exception('Failed to register a new user');
    }
  }
}
