import 'package:flutter/material.dart';
import 'package:flutter_meal_app/data/dummy_data.dart';
import 'package:flutter_meal_app/models/meals.dart';
import 'package:flutter_meal_app/screens/meals_screen.dart';
import 'package:flutter_meal_app/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key,  required this.availableMeals});
  final List<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        for (final category in availableCategories)
          CategoryItem(
            category: category,
            onItemClicked: (item) {
              final filterMeal = availableMeals
                  .where((meal) => meal.categories.contains(item.id))
                  .toList();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MealsScreen(
                        mealsList: filterMeal,
                        title: item.title,
                      )));
            },
          )
      ],
    );
  }
}
