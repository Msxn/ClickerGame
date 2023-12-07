import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clicker_game/providers/resource_provider.dart';

class MiningResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final resourceProvider = Provider.of<ResourceProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Résultats du minage"),
      ),
      body: ListView.builder(
        itemCount: resourceProvider.resources.length,
        itemBuilder: (context, index) {
          final resource = resourceProvider.resources[index];
          return ListTile(
            title: Text(resource.name),
            subtitle: ValueListenableBuilder<int>(
              valueListenable: resource.quantity,
              builder: (BuildContext context, int quantity, Widget? child) {
                return Text(
                  '$quantity',
                  style: TextStyle(color: Colors.black),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
