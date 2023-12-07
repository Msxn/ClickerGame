import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clicker_game/providers/resource_provider.dart';
import 'package:clicker_game/screens/mining_results_page.dart';
import 'package:clicker_game/screens/recipes_page.dart'; // Importez la page des recettes
import 'package:clicker_game/widgets/resource_widget.dart';

class ResourcesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final resourceProvider = Provider.of<ResourceProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Ressources"),
        actions: [
          IconButton(
            icon: Icon(Icons.fastfood),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RecipesPage()),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemBuilder: (context, index) {
          return ResourceWidget(resource: resourceProvider.resources[index]);
        },
        itemCount: resourceProvider.resources.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MiningResultsPage()),
          );
        },
        child: Icon(Icons.pageview),
      ),
    );
  }
}
