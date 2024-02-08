String? validateEmail(String? value) {
  if (value?.isEmpty ?? true) {
    return 'O email não pode ser vazio';
  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value ?? "")) {
    return 'O email não é válido';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value?.isEmpty ?? true) {
    return 'A senha não pode ser vazia';
  } else if ((value?.length ?? 0) < 6) {
    return 'A senha deve ter no mínimo 6 caracteres';
  }
  return null;
}

String? validateName(String? value) {
  if (value?.isEmpty ?? true) {
    return 'O nome não pode ser vazio';
  }
  return null;
}

String? validateLastName(String? value) {
  if (value?.isEmpty ?? true) {
    return 'O sobrenome não pode ser vazio';
  }
  return null;
}
