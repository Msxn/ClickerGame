import 'package:flutter/foundation.dart';

class Resource extends ChangeNotifier {
  final String key;
  final String name;
  final String color;
  final String description;
  final ValueNotifier<int> quantity;
  int craftAmount;

  Resource({
    required this.key,
    required this.name,
    required this.color,
    required this.description,
    int quantity = 0,
    this.craftAmount = 1,
  }) : quantity = ValueNotifier<int>(quantity);

  void incrementQuantity(int amount) {
    quantity.value += amount;
    notifyListeners();
  }
}