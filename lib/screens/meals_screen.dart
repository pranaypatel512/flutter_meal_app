import 'package:flutter/material.dart';
import 'package:flutter_meal_app/models/meals.dart';
import 'package:flutter_meal_app/screens/meal_details.dart';
import 'package:flutter_meal_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      required this.mealsList,
      this.title,
      required this.ontoggleMeal});
  final String? title;
  final List<Meal> mealsList;
  final void Function(Meal) ontoggleMeal;

  @override
  Widget build(BuildContext context) {
    late Widget bodyContent;
    if (mealsList.isEmpty) {
      bodyContent = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'oh no.. nothing here',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Try selecting a different category',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ],
        ),
      );
    } else {
      bodyContent = ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            meal: mealsList[index],
            onClick: (p0) {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return MealDetailScreen(
                    meanItem: p0,
                    ontoggleMeal: ontoggleMeal,
                  );
                },
              ));
            },
          );
        },
        itemCount: mealsList.length,
      );
    }
    if (title == null) {
      return bodyContent;
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text(title!),
          ),
          body: bodyContent);
    }
  }
}
