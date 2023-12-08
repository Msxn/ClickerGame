import 'package:flutter/material.dart';
import 'package:clicker_game/models/tool.dart';
import 'package:clicker_game/providers/resource_provider.dart';
import 'package:clicker_game/providers/recipes_provider.dart';

//Widget Outil à fabriquer
class ToolRecipeWidget extends StatelessWidget {
  final ResourceProvider resourceProvider;
  final RecipesProvider recipesProvider;
  final Function(double) setParentHeight;

  ToolRecipeWidget({required this.resourceProvider, required this.recipesProvider, required this.setParentHeight});

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
    setParentHeight((recipesProvider.getTools().length)*100.0);
    return ListView.builder(
      itemCount: recipesProvider.getTools().length,
      itemBuilder: (context, index) {
        Tool recipe = recipesProvider.getTools()[index];
        return ListTile(
          title: Text(recipe.name+" - "+recipe.key),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Coût : ${_buildCostString(recipe.cost)}\n${recipe.gameplay}\n${recipe.description}"),
              ValueListenableBuilder<bool>(
                valueListenable: recipe.active,
                builder: (context, activeValue, child) {
                  return Text("Activé : $activeValue");
                },
              ),
            ],
          ),
          onTap: () {
            if (_canCraftRecipe(recipe.cost)) {
              recipesProvider.craftRecipe(recipe.key, resourceProvider.resources);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Fabriqué"),
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