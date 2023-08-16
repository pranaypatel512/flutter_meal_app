import 'package:flutter/material.dart';
import 'package:flutter_meal_app/models/meals.dart';
import 'package:flutter_meal_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onClick});

  final Meal meal;
  final Function(Meal) onClick;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          onClick(meal);
        },
        child: Stack(
          children: [
            FadeInImage(
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl)),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemTrait(
                              iconData: Icons.schedule,
                              label: '${meal.duration} min'),
                          const SizedBox(
                            width: 20,
                          ),
                          MealItemTrait(
                              iconData: Icons.schedule, label: complexityText),
                          const SizedBox(
                            width: 20,
                          ),
                          MealItemTrait(
                              iconData: Icons.attach_money,
                              label: affordabilityText),
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
