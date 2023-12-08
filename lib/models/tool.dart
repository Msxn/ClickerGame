import 'package:flutter/foundation.dart';
import 'package:clicker_game/models/recipe.dart';

//Objet Outil (Pioche, Hache...)
class Tool extends Recipe{
  final Map<String, int> craftAmount;
  final ValueNotifier<bool> active;

  Tool({
    required bool setActive,
    required String key,
    required String name,
    required Map<String, int> cost,
    required String gameplay,
    required String type,
    required String description,
    required this.craftAmount,
    required bool activeInitialValue,
  })  : active = ValueNotifier<bool>(activeInitialValue),
        super(
          setActive: setActive,
          key: key,
          name: name,
          cost: cost,
          gameplay: gameplay,
          type: type,
          description: description,
        );

  // Getter to access the current value
  bool get activeValue => active.value;

  // Setter to update the value
  set activeValue(bool newValue) {
    active.value = newValue;
  }

  void addIsSomethingEnabledListener(VoidCallback listener) {
    active.addListener(listener);
  }

  void dispose() {
    active.dispose();
    super.dispose(); 
  }
}