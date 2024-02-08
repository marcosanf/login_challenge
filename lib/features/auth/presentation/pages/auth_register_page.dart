import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:login_challenge/core/utils/validators.dart';
import 'package:login_challenge/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:login_challenge/features/auth/presentation/pages/home_page.dart';
import 'package:login_challenge/features/auth/presentation/widgets/l_button.dart';
import '../../domain/entities/user_entity.dart';
import '../widgets/l_text_form_field.dart';

class AuthRegisterPage extends StatelessWidget {
  const AuthRegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final authRegisterFormKey = GlobalKey<FormState>();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    const mainColor = Color(0xFF471AA0);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Ionicons.chevron_back,
            size: 20,
            color: Color(0xFF471AA0),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
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
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: authRegisterFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Criar Conta',
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
                    nameController: nameController,
                    labelText: 'Nome',
                    validator: (value) => validateName(value),
                  ),
                  const SizedBox(height: 16),
                  LTextFormField(
                    prefixIcon: const Icon(
                      Ionicons.person_outline,
                      color: mainColor,
                    ),
                    nameController: lastNameController,
                    labelText: 'Sobrenome',
                    validator: (value) => validateLastName(value),
                  ),
                  const SizedBox(height: 16),
                  LTextFormField(
                    prefixIcon: const Icon(
                      Ionicons.mail_outline,
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
                    sufixIcon: const Icon(
                      Ionicons.eye_off_outline,
                      color: mainColor,
                    ),
                    nameController: passwordController,
                    labelText: 'Senha',
                    obscureText: true,
                    validator: (value) => validatePassword(value),
                  ),
                  const SizedBox(height: 32),
                  LButton(
                    text: 'Cadastrar',
                    onPressed: () {
                      if (authRegisterFormKey.currentState?.validate() ??
                          false) {
                        final name = nameController.text;
                        final lastName = lastNameController.text;
                        final email = emailController.text;
                        final password = passwordController.text;
                        context.read<AuthCubit>().register(
                              UserEntity(
                                name: name,
                                lastName: lastName,
                                email: email,
                                password: password,
                                id: '',
                              ),
                            );
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
