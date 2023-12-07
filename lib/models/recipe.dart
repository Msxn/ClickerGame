import 'package:flutter/foundation.dart';

class Recipe extends ChangeNotifier {
  final String key;
  final String name;
  final Map<String, int> cost;
  final String gameplay;
  final String type;
  final String description;
  final ValueNotifier<int> quantity;

  Recipe({
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