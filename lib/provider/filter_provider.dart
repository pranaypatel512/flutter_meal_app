import 'package:flutter_meal_app/provider/meal_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter { gultenFree, lactoseFree, vegiterian, vegan }

class FilterProvider extends StateNotifier<Map<Filter, bool>> {
  FilterProvider()
      : super({
          Filter.gultenFree: false,
          Filter.lactoseFree: false,
          Filter.vegiterian: false,
          Filter.vegan: false,
        });

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }

  void setFilters(Map<Filter, bool> choosenfilter) {
    state = choosenfilter;
  }
}

final filterProvider = StateNotifierProvider<FilterProvider, Map<Filter, bool>>(
    (ref) => FilterProvider());

final filtersMealProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilter = ref.watch(filterProvider);

  return meals.where((meal) {
    if (activeFilter[Filter.gultenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilter[Filter.vegiterian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilter[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
