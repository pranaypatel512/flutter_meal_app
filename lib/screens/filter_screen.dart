import 'package:flutter/material.dart';

// import 'package:flutter_meal_app/screens/tabs.dart';
// import 'package:flutter_meal_app/widgets/app_drawer.dart';
enum Filter { gultenFree, lactoseFree, vegiterian, vegan }

class MealFilterScreen extends StatefulWidget {
  const MealFilterScreen({super.key, required this.currentFilter});

  final Map<Filter,bool> currentFilter;

  @override
  State<MealFilterScreen> createState() => _MealFilterScreenState();
}

class _MealFilterScreenState extends State<MealFilterScreen> {
  var _gultenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegiterianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    _gultenFreeFilterSet = widget.currentFilter[Filter.gultenFree] ?? false;
    _lactoseFreeFilterSet = widget.currentFilter[Filter.lactoseFree] ?? false;
    _vegiterianFilterSet = widget.currentFilter[Filter.vegiterian] ?? false;
    _veganFilterSet = widget.currentFilter[Filter.vegan] ?? false;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, {
          Filter.gultenFree: _gultenFreeFilterSet,
          Filter.lactoseFree: _lactoseFreeFilterSet,
          Filter.vegiterian: _vegiterianFilterSet,
          Filter.vegan: _veganFilterSet
        });
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Your filter'),
        ),
        // drawer: MainDrawer(
        //   onSelectedScreen: (p0) {
        //     Navigator.of(context).pop();
        //     if (p0 == 'meals') {
        //       Navigator.of(context).pushReplacement(MaterialPageRoute(
        //         builder: (context) {
        //           return TabsScreen();
        //         },
        //       ));
        //     }
        //   },
        // ),
        body: Column(
          children: [
            SwitchListTile(
              value: _gultenFreeFilterSet,
              onChanged: (value) {
                setState(() {
                  _gultenFreeFilterSet = value;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include Gluten-free meals.',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 32, right: 22),
            ),
            SwitchListTile(
              value: _lactoseFreeFilterSet,
              onChanged: (value) {
                setState(() {
                  _lactoseFreeFilterSet = value;
                });
              },
              title: Text(
                'Lectose-free',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include lectose-free meals.',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 32, right: 22),
            ),
            SwitchListTile(
              value: _vegiterianFilterSet,
              onChanged: (value) {
                setState(() {
                  _vegiterianFilterSet = value;
                });
              },
              title: Text(
                'Vegiterian',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include vegiterian meals.',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 32, right: 22),
            ),
            SwitchListTile(
              value: _veganFilterSet,
              onChanged: (value) {
                setState(() {
                  _veganFilterSet = value;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include Vegan meals.',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 32, right: 22),
            )
          ],
        ),
      ),
    );
  }
}
