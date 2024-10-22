// Classe modelo que representa um item do carrinho
class CartItem
{
  // Atributos
  final String id;
  final String productId;
  final String name;
  final double price;
  final double quantity;

  // Construtor
  CartItem({
  required this.id,
  required this.productId,
  required this.name,
  required this.price,
  required this.quantity
  });
} 