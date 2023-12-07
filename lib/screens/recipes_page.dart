import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clicker_game/providers/resource_provider.dart';
import 'package:clicker_game/providers/recipes_provider.dart';
import 'package:clicker_game/widgets/tool_recipe_widget.dart';
import 'package:clicker_game/widgets/rawmat_recipe_widget.dart';

class RecipesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final resourceProvider = Provider.of<ResourceProvider>(context);
    final recipesProvider = Provider.of<RecipesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Recettes"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RawMatRecipeWidget(resourceProvider: resourceProvider, recipesProvider: recipesProvider),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ToolRecipeWidget(resourceProvider: resourceProvider, recipesProvider: recipesProvider),
            ),
          ),
        ],
      ),
    );
  }
}