class CartItem
{
  // atributos
  final String id;
  final String productId;
  final String name;
  final int quantity;
  final double price;

  // Construtor
  const CartItem({
    required this.id,
    required this.productId,
    required this.name,
    required this.quantity,
    required this.price,
  });
}