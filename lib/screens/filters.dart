import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      drawer: MainDrawer(onSelectScreen: (identifier) {
        Navigator.of(context).pop();
        if (identifier == 'meals') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const TabsScreen()),
          );
        }
      }),
      body: Column(
        children: [
          SwitchListTile(
            value: _glutenFreeFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _glutenFreeFilterSet = isChecked;
              });
            },
            title: const Text(
              'Gluten-free',
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
            ),
            subtitle: Text(
              'Only Include gluten free food',
              style: TextStyle(color: Colors.blueGrey[100]),
            ),
            activeColor: Colors.blueGrey,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: _lactoseFreeFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _lactoseFreeFilterSet = isChecked;
              });
            },
            title: const Text(
              'Lactose-free',
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
            ),
            subtitle: Text(
              'Only Include lactose free food',
              style: TextStyle(color: Colors.blueGrey[100]),
            ),
            activeColor: Colors.blueGrey,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: _vegetarianFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _vegetarianFilterSet = isChecked;
              });
            },
            title: const Text(
              'Vegetarian',
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
            ),
            subtitle: Text(
              'Only Include vegetarian food',
              style: TextStyle(color: Colors.blueGrey[100]),
            ),
            activeColor: Colors.blueGrey,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: _veganFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _veganFilterSet = isChecked;
              });
            },
            title: const Text(
              'Vegan',
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
            ),
            subtitle: Text(
              'Only Include vegan food',
              style: TextStyle(color: Colors.blueGrey[100]),
            ),
            activeColor: Colors.blueGrey,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          )
        ],
      ),
    );
  }
}
