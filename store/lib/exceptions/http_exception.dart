// Classe para implementarmos as exceções da requisição Http delete 
class HttpException implements Exception {

  // Atributos
  final String message;
  final int statusCode;

  // Construtor
  const HttpException({required this.message, required this.statusCode });

  @override
  String toString() {
    return message;
  }
}