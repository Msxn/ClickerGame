import 'package:clicker_game/models/recipe.dart';

//Objet Composant (Fil Electrique, etc...)
class CompMaterial extends Recipe{
  final Set<String> unlockWhich;
  final int quantityPerCraft;

  CompMaterial({
    required bool setActive,
    required String key,
    required String name,
    required Map<String, int> cost,
    required String gameplay,
    required String type,
    required String description,
    required this.unlockWhich,
    this.quantityPerCraft=1,
  })  : super(
          setActive: setActive,
          key: key,
          name: name,
          cost: cost,
          gameplay: gameplay,
          type: type,
          description: description,
        );

  void dispose() {
    super.dispose();
  }
}