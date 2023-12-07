import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clicker_game/models/resource.dart';
import 'package:clicker_game/providers/resource_provider.dart';

class ResourceWidget extends StatelessWidget {
  final Resource resource;

  ResourceWidget({required this.resource});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<ResourceProvider>(context, listen: false)
            .incrementResourceQuantity(resource.key, resource.craftAmount);
      },
      child: Container(
        color: Color(int.parse(resource.color.replaceAll('#', '0xFF'))),
        child: Center(
          child: ValueListenableBuilder<int>(
            valueListenable: resource.quantity,
            builder: (BuildContext context, int quantity, Widget? child) {
              return Text(
                '${resource.name}\n$quantity\nCliquer pour miner',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              );
            },
          ),
        ),
      ),
    );
  }
}
