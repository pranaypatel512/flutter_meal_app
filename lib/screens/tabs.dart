import 'package:flutter/material.dart';
import 'package:flutter_meal_app/models/meals.dart';
import 'package:flutter_meal_app/screens/categories_screen.dart';
import 'package:flutter_meal_app/screens/meals_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedIndex = 0;
  var activePageTitle = 'Category';
  final List<Meal> _favouriteMeals = [];

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).clearMaterialBanners();
    ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
        content: Text(
          message,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        actions: [
          IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).clearMaterialBanners();
              },
              icon: const Icon(Icons.close))
        ]));
  }

  void _toggleFavMeals(Meal meal) {
    if (_favouriteMeals.contains(meal)) {
      setState(() {
        _favouriteMeals.remove(meal);
      });
      _showMessage('Meal is no longer a favourite');
    } else {
      setState(() {
        _favouriteMeals.add(meal);
      });
      _showMessage('Marked as a favourite');
    }
  }

  void _selectPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyWidget = CategoriesScreen(ontoggleMeal: _toggleFavMeals);
    activePageTitle = 'Category';
    if (selectedIndex == 1) {
      bodyWidget = MealsScreen(
          mealsList: _favouriteMeals, ontoggleMeal: _toggleFavMeals);
      activePageTitle = 'Your Favourite';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: bodyWidget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourite'),
        ],
        onTap: _selectPage,
      ),
    );
  }
}
