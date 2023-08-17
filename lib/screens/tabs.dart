import 'package:flutter/material.dart';
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

  void _selectPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyWidget = CategoriesScreen();
    activePageTitle = 'Category';
    if (selectedIndex == 1) {
      bodyWidget = MealsScreen(mealsList: []);
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
