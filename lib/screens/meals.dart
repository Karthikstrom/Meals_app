import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.title,
    required this.meals,
  });
  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (BuildContext context, int index) {
          return listViewBox(
            meals[index].imageUrl,
            meals[index].title,
            meals[index].affordability,
          );
        });
    if (meals.isEmpty) {
      content = const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Oops No Items to display Here',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }

  Widget listViewBox(String imageURL, String title, Enum affordability) {
    return Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Image.network(imageURL),
            Column(
              children: [
                Text(title),
                Text('$affordability'),
              ],
            ),
          ],
        ));
  }
}
