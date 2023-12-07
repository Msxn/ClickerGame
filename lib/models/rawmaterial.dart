import 'package:clicker_game/models/recipe.dart';

class RawMaterial extends Recipe{
  final Set<String> unlockWhich;
  final int quantityPerCraft;

  RawMaterial({
    required String key,
    required String name,
    required Map<String, int> cost,
    required String gameplay,
    required String type,
    required String description,
    required this.unlockWhich,
    required this.quantityPerCraft,
  })  : super(
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