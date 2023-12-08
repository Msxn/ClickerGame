import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clicker_game/providers/resource_provider.dart';
import 'package:clicker_game/providers/recipes_provider.dart';
import 'package:clicker_game/screens/resources_page.dart';
import 'package:clicker_game/screens/mining_results_page.dart';

//Page Main avec les Routes
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ResourceProvider()),
        ChangeNotifierProvider(create: (context) => RecipesProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/resources',
      routes: {
        '/resources': (context) => ResourcesPage(),
        '/mining': (context) => MiningResultsPage(),
      },
    );
  }
}