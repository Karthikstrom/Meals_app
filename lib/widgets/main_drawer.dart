import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blueGrey, Colors.white],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
            child: Row(
              children: [
                Icon(Icons.fastfood, size: 48, color: Colors.white),
                SizedBox(
                  width: 18,
                ),
                Text('Cooking Up!'),
              ],
            ),
          ),
          const SizedBox(height: 15),
          ListTile(
            leading: const Icon(Icons.menu, color: Colors.white, size: 26),
            title: const Text('Meals',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.white)),
            onTap: () {
              onSelectScreen('meals');
            },
          ),
          const SizedBox(height: 15),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.white, size: 26),
            title: const Text('Filters',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.white)),
            onTap: () {
              onSelectScreen('filters');
            },
          ),
        ],
      ),
    );
  }
}
