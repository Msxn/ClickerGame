import 'package:flutter/material.dart';
import 'package:clicker_game/models/resource.dart';

class ResourceProvider extends ChangeNotifier {
  final List<Resource> _resources = [
    Resource(key: 'wood', name: 'Bois', color: '#967969', description: 'Du bois brut'),
    Resource(key: 'iron_ore', name: 'Minerai de fer', color: '#ced4da', description: 'Du minerai de fer brut'),
    Resource(key: 'copper_ore', name: 'Minerai de cuivre', color: '#d9480f', description: 'Du minerai de cuivre brut'),
    Resource(key: 'coal', name: 'Charbon', color: '#111111', description: 'Du minerai de charbon'),
  ];

  List<Resource> get resources => _resources;

  // Méthode pour incrémenter la quantité de ressources
  void incrementResourceQuantity(String resourceKey, int amount) {
    final resource = _resources.firstWhere((r) => r.key == resourceKey);
    resource.incrementQuantity(amount);
  }

}
