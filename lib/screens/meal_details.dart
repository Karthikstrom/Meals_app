import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorites_provider.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({
    super.key,
    required this.steps,
    required this.meal,
  });

  final List<String> steps;
  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleMealFavoriteStatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content:
                    Text(wasAdded ? 'Meal added a favorite' : 'Meal Removed'),
              ));
            },
            icon: const Icon(Icons.star),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 10),
              const Text(
                'Ingredients',
                style: TextStyle(color: Colors.orange, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              for (final ingredient in meal.ingredients)
                Text(
                  ingredient,
                  style: const TextStyle(color: Colors.white),
                ),
              const SizedBox(height: 10),
              const Text(
                'Steps',
                style: TextStyle(color: Colors.orange, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              for (final step in meal.steps)
                Text(
                  step,
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  style: const TextStyle(color: Colors.white),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
