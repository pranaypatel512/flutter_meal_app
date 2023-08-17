import 'package:flutter/material.dart';
import 'package:flutter_meal_app/models/meals.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen(
      {super.key, required this.meanItem, required this.ontoggleMeal});
  final Meal meanItem;
  final void Function(Meal) ontoggleMeal;

  @override
  Widget build(BuildContext context) {
    late Widget bodyContent;

    bodyContent = SingleChildScrollView(
      child: Column(
        children: [
          FadeInImage(
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meanItem.imageUrl)),
          const SizedBox(
            height: 14,
          ),
          Text(
            'Ingredients',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontWeight: FontWeight.bold),
          ),
          for (final ind in meanItem.ingredients)
            Text(
              ind,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          const SizedBox(
            height: 14,
          ),
          Text(
            'Steps',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontWeight: FontWeight.bold),
          ),
          for (final ind in meanItem.steps)
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
              child: Text(
                ind,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
        ],
      ),
    );
    return Scaffold(
        appBar: AppBar(
          title: Text(meanItem.title),
          actions: [
            IconButton(
                onPressed: () {
                  ontoggleMeal(meanItem);
                },
                icon: Icon(
                  Icons.star,
                ))
          ],
        ),
        body: bodyContent);
  }
}
