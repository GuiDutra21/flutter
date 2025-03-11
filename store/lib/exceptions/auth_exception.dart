
class AuthException implements Exception {
  static const Map<String, String> erros = 
  {
    'EMAIL_EXISTS' : 'E-mail já cadastrado',
    'OPERATION_NOT_ALLOWED:' : 'Operação não permitida!',
    'TOO_MANY_ATTEMPTS_TRY_LATER' : 'Você tentou muitas vezes.Tente novamente mais tarde',
    'EMAIL_NOT_FOUND' : 'E-mail não encontrado',
    'INVALID_PASSWORD' : 'Senha incorreta',
    'USER_DISABLED' : 'A conta do usuário foi desabilitada!',
  };

  final String key;

  AuthException(this.key);

  @override
  String toString()
  {
    return erros['values'] ?? 'Ocorreu um erro de autenticação';
  }

}