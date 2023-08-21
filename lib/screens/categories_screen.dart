import 'package:flutter/material.dart';
import 'package:flutter_meal_app/data/dummy_data.dart';
import 'package:flutter_meal_app/models/meals.dart';
import 'package:flutter_meal_app/screens/meals_screen.dart';
import 'package:flutter_meal_app/widgets/category_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});
  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        lowerBound: 0,
        upperBound: 1,
        duration: Duration(milliseconds: 300));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        child: GridView(
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
                  final filterMeal = widget.availableMeals
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
        ),
        builder: (context, child) => Padding(
              padding:
                  EdgeInsets.only(top: 100 - _animationController.value * 100),
              child: child,
            ));
  }
}
