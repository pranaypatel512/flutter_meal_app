import 'package:flutter/material.dart';
import 'package:flutter_meal_app/models/meals.dart';
import 'package:flutter_meal_app/provider/meal_provider.dart';
import 'package:flutter_meal_app/screens/categories_screen.dart';
import 'package:flutter_meal_app/screens/filter_screen.dart';
import 'package:flutter_meal_app/screens/meals_screen.dart';
import 'package:flutter_meal_app/widgets/app_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const kInitialFilter = {
  Filter.gultenFree: false,
  Filter.lactoseFree: false,
  Filter.vegiterian: false,
  Filter.vegan: false
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int selectedIndex = 0;
  var activePageTitle = 'Category';
  final List<Meal> _favouriteMeals = [];
  Map<Filter, bool> filters = kInitialFilter;

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

  void _onSelection(String itemName) async {
    Navigator.of(context).pop();
    if (itemName == 'filters') {
      final result = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          return MealFilterScreen(
            currentFilter: filters,
          );
        },
      ));
      setState(() {
        filters = result ?? kInitialFilter;
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filterMeals = ref.watch(mealsProvider).where((meal) {
      if (filters[Filter.gultenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (filters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (filters[Filter.vegiterian]! && !meal.isVegetarian) {
        return false;
      }
      if (filters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget bodyWidget = CategoriesScreen(
      ontoggleMeal: _toggleFavMeals,
      availableMeals: filterMeals,
    );
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
      drawer: MainDrawer(
        onSelectedScreen: _onSelection,
      ),
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
