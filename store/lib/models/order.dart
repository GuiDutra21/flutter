import 'cart_item.dart';

// Classe modelo que representa apenas um pedido
class Order {

  // Atributos
  final String id;
  final double total;
  final List<CartItem> products;
  final DateTime date;

  // Construtor
  Order({
    required this.id,
    required this.total,
    required this.products,
    required this.date,
  });
}