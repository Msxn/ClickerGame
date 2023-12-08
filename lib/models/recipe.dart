import 'package:flutter/foundation.dart';

//Objet Recipe de base à étendre
class Recipe extends ChangeNotifier {
  final bool setActive;
  final String key;
  final String name;
  final Map<String, int> cost;
  final String gameplay;
  final String type;
  final String description;
  final ValueNotifier<int> quantity;

  Recipe({
    required this.setActive,
    required this.key,
    required this.name,
    required this.cost,
    required this.gameplay,
    required this.type,
    required this.description,
    int quantity = 0,
  }) : quantity = ValueNotifier<int>(quantity);

  void incrementQuantity(int amount) {
    quantity.value += amount;
    notifyListeners();
  }
}