import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clicker_game/providers/resource_provider.dart';
import 'package:clicker_game/providers/recipes_provider.dart';
import 'package:clicker_game/widgets/tool_recipe_widget.dart';
import 'package:clicker_game/widgets/rawmat_recipe_widget.dart';
import 'package:clicker_game/widgets/comp_recipe_widget.dart';

//Page principale des recettes - affiche des widgets par groupe de recettes
class RecipesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final resourceProvider = Provider.of<ResourceProvider>(context);
    final recipesProvider = Provider.of<RecipesProvider>(context);
    double parentHeight = 0.0;

    return Scaffold(
      appBar: AppBar(
        title: Text("Recettes"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Matières premières',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: RawMatRecipeWidget(
              resourceProvider: resourceProvider,
              recipesProvider: recipesProvider,
              setParentHeight: (height) {
                parentHeight = height;
              },
            ),
          ),
          Text(
            'Outils',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ToolRecipeWidget(
              resourceProvider: resourceProvider,
              recipesProvider: recipesProvider,
              setParentHeight: (height) {
                parentHeight = height;
              },
            ),
          ),
          Text(
            'Composants',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: CompRecipeWidget(
              resourceProvider: resourceProvider,
              recipesProvider: recipesProvider,
              setParentHeight: (height) {
                parentHeight = height;
              },
            ),
          ),
        ],
      ),
    );
  }
}