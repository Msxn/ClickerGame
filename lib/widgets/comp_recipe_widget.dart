import 'package:clicker_game/models/component.dart';
import 'package:flutter/material.dart';
import 'package:clicker_game/providers/resource_provider.dart';
import 'package:clicker_game/providers/recipes_provider.dart';

//Widget Composant à fabriquer
class CompRecipeWidget extends StatelessWidget {
  final ResourceProvider resourceProvider;
  final RecipesProvider recipesProvider;
  final Function(double) setParentHeight;

  CompRecipeWidget({required this.resourceProvider, required this.recipesProvider, required this.setParentHeight});

  String _buildCostString(Map<String, int> cost) {
    return cost.entries.map((entry) => "${entry.value} ${entry.key}").join(", ");
  }

  bool _canCraftRecipe(Map<String, int> cost) {
    for (final entry in cost.entries) {
      final key = entry.key;
      final value = entry.value;

      if(key.startsWith("r_")){
        final availableRecipe = recipesProvider.getRecipes().firstWhere((r) => r.key == key);
        if (availableRecipe.quantity.value < value) {
          return false;
        }
      }else{
        final availableResource = resourceProvider.resources.firstWhere((r) => r.key == key);
        if (availableResource.quantity.value < value) {
          return false;
        }
      }
      
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    setParentHeight((recipesProvider.getComponents().length)*100.0);
    return ListView.builder(
      itemCount: recipesProvider.getComponents().length,
      itemBuilder: (context, index) {
        CompMaterial recipe = recipesProvider.getComponents()[index];
        return ListTile(
          title: Text(recipe.name+" - "+recipe.key),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Coût : ${_buildCostString(recipe.cost)}\n${recipe.gameplay}\n${recipe.description}"),
              ValueListenableBuilder<int>(
                valueListenable: recipe.quantity,
                builder: (context, quantity, child) {
                  return Text("Quantité : $quantity");
                },
              ),
            ],
          ),
          onTap: () {
            if (_canCraftRecipe(recipe.cost)) {
              recipesProvider.craftRecipe(recipe.key, resourceProvider.resources);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Item fabriqué'),
              ));
            } else {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Impossible de fabriquer la recette"),
                  content: Text("Vous n'avez pas assez de ressources."),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("OK"),
                    ),
                  ],
                ),
              );
            }
          },
        );
      },
    );
  }
}