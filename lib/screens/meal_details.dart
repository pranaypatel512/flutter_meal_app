import 'package:flutter/material.dart';
import 'package:flutter_meal_app/models/meals.dart';
import 'package:flutter_meal_app/provider/favorite_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({super.key, required this.mealItem});
  final Meal mealItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeal = ref.watch(favoriteMealsNotifier);
    final isFav = favoriteMeal.contains(mealItem);
    late Widget bodyContent;

    bodyContent = SingleChildScrollView(
      child: Column(
        children: [
          Hero(
            tag: mealItem.id,
            child: FadeInImage(
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(mealItem.imageUrl)),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            'Ingredients',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontWeight: FontWeight.bold),
          ),
          for (final ind in mealItem.ingredients)
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
          for (final ind in mealItem.steps)
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
          title: Text(mealItem.title),
          actions: [
            IconButton(
                onPressed: () {
                  final wasAdded = ref
                      .read(favoriteMealsNotifier.notifier)
                      .toggleMealFavoriteStatus(mealItem);

                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          wasAdded
                              ? 'Meal added as favorite.'
                              : 'Meal remove from favorite.',
                          style: Theme.of(context).textTheme.titleMedium),
                      action: SnackBarAction(
                          label: 'OK',
                          onPressed: () {
                            ScaffoldMessenger.of(context).clearSnackBars();
                          })));
                },
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Icon(
                    isFav ? Icons.star : Icons.star_border_outlined,
                    key: ValueKey(isFav),
                  ),
                  transitionBuilder: (child, animation) {
                    return RotationTransition(
                      turns: Tween(begin: 0.8, end: 1.0).animate(animation),
                      child: child,
                    );
                  },
                ))
          ],
        ),
        body: bodyContent);
  }
}
