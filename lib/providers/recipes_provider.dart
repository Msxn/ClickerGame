import 'package:clicker_game/models/component.dart';
import 'package:flutter/material.dart';
import 'package:clicker_game/models/resource.dart';
import 'package:clicker_game/models/recipe.dart';
import 'package:clicker_game/models/rawmaterial.dart';
import 'package:clicker_game/models/tool.dart';

//Controlleur de tous les objets de type Recipe et ceux qui étendent cette classe
class RecipesProvider extends ChangeNotifier{
  final List<Recipe> _recipes = 
  [
    //Tools
    Tool(
      setActive: true,
      key:'r_axe',
      name: 'Hache',
      cost: {'wood': 2, 'r_iron_stick': 2}, 
      gameplay: 'Récolter le bois 3 par 3 (3 par click)',
      type: 'Outil',
      description: 'Un outil utile',
      craftAmount: {'wood' : 3},
      activeInitialValue: false
    ),
    Tool(
      setActive: true,
      key:'r_pickaxe',
      name: 'Pioche',
      cost: {'wood': 2, 'r_iron_stick': 3}, 
      gameplay: 'Récolter les minerais 5 par 5 (5 par click)',
      type: 'Outil',
      description: 'Un outil utile',
      craftAmount: {'iron_ore' : 5, "copper_ore" : 5},
      activeInitialValue: false
    ),
    //Raw Materials
    RawMaterial(
      setActive: true,
      key:'r_iron_ingot',
      name: 'Lingot de fer',
      cost: {'iron_ore': 1}, 
      gameplay: 'Débloque d\'autres recettes',
      type: 'Matériau',
      description: 'Un lingot de fer pur',
      unlockWhich: {'iron_stick'},
      quantityPerCraft: 1,
    ),
    RawMaterial(
      setActive: true,
      key:'r_iron_plate',
      name: 'Plaque de fer',
      cost: {'iron_ore': 3}, 
      gameplay: 'Débloque d\'autres recettes',
      type: 'Matériau',
      description: 'Une plaque de fer',
      unlockWhich: {'iron_stick'},
      quantityPerCraft: 2,
    ),
    RawMaterial(
      setActive: true,
      key:'r_iron_stick',
      name: 'Tige de fer',
      cost: {'r_iron_ingot': 1}, 
      gameplay: 'Débloque d\'autres recettes',
      type: 'Matériau',
      description: 'Une tige en metal',
      unlockWhich: {},
      quantityPerCraft: 1,
    ),
    //Components
    CompMaterial(
      setActive: true,
      key:'r_copper_line',
      name: 'Fil électrique',
      cost: {'r_iron_ingot': 1}, 
      gameplay: 'Débloque d\'autres recettes',
      type: 'Matériau',
      description: 'Un fil électrique pour fabriquer des composants électroniques',
      unlockWhich: {''},
      quantityPerCraft: 1,
    )
  ];


  List<Recipe> getRecipes() {
    return _recipes;
  }

  List<Tool> getTools() {
    List<Tool> temporaryToolList = [];
    for(Recipe tool in getRecipes()){
      if(tool is Tool){
        temporaryToolList.add(tool);
      }
    }
    return temporaryToolList;
  }

  List<RawMaterial> getMaterials() {
    List<RawMaterial> temporaryMatList = [];
    for(Recipe rawmat in getRecipes()){
      if(rawmat is RawMaterial){
        temporaryMatList.add(rawmat);
      }
    }
    return temporaryMatList;
  }

  List<CompMaterial> getComponents() {
    List<CompMaterial> temporaryCompList = [];
    for(Recipe component in getRecipes()){
      if(component is CompMaterial){
        temporaryCompList.add(component);
      }
    }
    return temporaryCompList;
  }



  void craftRecipe(String recipeKey, List<Resource> resources) {

    final recipe = _recipes.firstWhere((r) => r.key == recipeKey);

    for (final entry in recipe.cost.entries) {
      final key = entry.key;
      final value = entry.value;

      if(key.startsWith("r_")){
        final availableRecipe = getRecipes().firstWhere((r) => r.key == key);
        availableRecipe.incrementQuantity(value*-1);
      }else{
        final availableResource = resources.firstWhere((r) => r.key == key);
        availableResource.incrementQuantity(value*-1);
      }
      
    }

    if(recipe is RawMaterial){
      recipe.incrementQuantity(recipe.quantityPerCraft);
    }

    if(recipe is Tool){
      recipe.activeValue = true;
      for (final entry in recipe.craftAmount.entries) {
        final key = entry.key;
        final value = entry.value;

        final resource = resources.firstWhere((r) => r.key == key);
        resource.craftAmount = value;
      }
    }

    if(recipe is CompMaterial){
      recipe.incrementQuantity(recipe.quantityPerCraft);
    }

  }
}
