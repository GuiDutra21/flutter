
class Product {

  // Atriibutos
  final String id; 
  final String title; 
  final String description; 
  final double price; 
  final String imageUrl; 
  bool isFavorite;

  // Construtor
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.imageUrl,
    this.isFavorite = false
  });

  // Método
  void _toggleFavorte()
  {
     isFavorite = !isFavorite;
  }
}