import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:login_challenge/core/utils/validators.dart';
import 'package:login_challenge/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:login_challenge/features/auth/presentation/pages/auth_register_page.dart';
import 'package:login_challenge/features/auth/presentation/pages/home_page.dart';
import 'package:login_challenge/features/auth/presentation/widgets/l_button.dart';
import '../widgets/l_text_form_field.dart';

class AuthLoginPage extends StatelessWidget {
  const AuthLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final authLoginFormKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    const mainColor = Color(0xFF471AA0);

    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 40,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox.shrink(),
                Form(
                  key: authLoginFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 30,
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 32),
                      LTextFormField(
                        prefixIcon: const Icon(
                          Ionicons.person_outline,
                          color: mainColor,
                        ),
                        nameController: emailController,
                        labelText: 'Email',
                        validator: (value) => validateEmail(value),
                      ),
                      const SizedBox(height: 16),
                      LTextFormField(
                        prefixIcon: const Icon(
                          Ionicons.lock_closed_outline,
                          color: mainColor,
                        ),
                        nameController: passwordController,
                        labelText: 'Senha',
                        obscureText: true,
                        validator: (value) => validatePassword(value),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    LButton(
                      text: 'Entrar',
                      onPressed: () {
                        if (authLoginFormKey.currentState?.validate() ??
                            false) {
                          print('Validated');
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AuthRegisterPage()),
                          );
                        },
                        child: const Text(
                            'Ainda não possui uma conta? Cadastre-se!'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
