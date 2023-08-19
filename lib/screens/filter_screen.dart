import 'package:flutter/material.dart';
import 'package:flutter_meal_app/provider/filter_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:flutter_meal_app/screens/tabs.dart';
// import 'package:flutter_meal_app/widgets/app_drawer.dart';

class MealFilterScreen extends ConsumerWidget {
  const MealFilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilter = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filter'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilter[Filter.gultenFree]!,
            onChanged: (value) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.gultenFree, value);
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only include Gluten-free meals.',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 32, right: 22),
          ),
          SwitchListTile(
            value: activeFilter[Filter.lactoseFree]!,
            onChanged: (value) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.lactoseFree, value);
            },
            title: Text(
              'Lectose-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only include lectose-free meals.',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 32, right: 22),
          ),
          SwitchListTile(
            value: activeFilter[Filter.vegiterian]!,
            onChanged: (value) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.vegiterian, value);
            },
            title: Text(
              'Vegiterian',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only include vegiterian meals.',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 32, right: 22),
          ),
          SwitchListTile(
            value: activeFilter[Filter.vegan]!,
            onChanged: (value) {
              ref.read(filterProvider.notifier).setFilter(Filter.vegan, value);
            },
            title: Text(
              'Vegan',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only include Vegan meals.',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 32, right: 22),
          )
        ],
      ),
    );
  }
}
