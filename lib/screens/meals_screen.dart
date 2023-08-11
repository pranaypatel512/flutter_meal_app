import 'package:flutter/material.dart';
import 'package:flutter_meal_app/models/meals.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.mealsList, required this.title});
  final String title;
  final List<Meal> mealsList;

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
          return Text(
            mealsList[index].title,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
          );
        },
        itemCount: mealsList.length,
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: bodyContent);
  }
}
