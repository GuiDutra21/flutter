
// Classe que representa o modelo dos switchs nas configurações
class Setting {
  
  // Atributos
  bool isGlutenFree;
  bool isLactoseFree;
  bool isVegan;
  bool isVegetarian;

  // Construtor
  Setting({
  this.isGlutenFree = false,
  this.isLactoseFree = false,
  this.isVegan = false,
  this.isVegetarian = false,
  });
}
