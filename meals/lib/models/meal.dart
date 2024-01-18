// Classe que representa as refeições 
enum Complexity
{
  simple,
  medium,
  difficult,
}

enum Cost
{
  cheap,
  fair,
  expensive,
}

class Meal
{
  // Atributos
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final Complexity complexity;
  final Cost cost;

  // Construtor
  const Meal({
  required this.id,
  required this.categories,
  required this.title,
  required this.imageUrl,
  required this.ingredients,
  required this.steps,
  required this.duration,
  required this.isGlutenFree,
  required this.isLactoseFree,
  required this.isVegan,
  required this.isVegetarian,
  required this.complexity,
  required this.cost,
  });

  // getters
  String get complexityText
  {
    switch(complexity)
    {
      case Complexity.simple:
        return "Simples";
      case Complexity.medium:
        return "Médio";
      case Complexity.difficult:
        return "Difícil";
    }
  }

  String get costText
  {
    switch(cost)
    {
      case Cost.cheap:
        return "Barato";
      case Cost.fair:
        return "Razoável";
      case Cost.expensive:
        return "Caro";
    }
  }
}