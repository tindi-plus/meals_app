import 'package:go_router/go_router.dart';

import 'package:flutter/material.dart';
import 'package:meals_app/models/filters.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  Filters filters;
  Function setFilters;

  FilterScreen({super.key, required this.filters, required this.setFilters});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters!'),
        actions: [
          IconButton(
            onPressed: () {
              widget.setFilters(widget.filters);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      drawer: MainDrawer(
        filters: widget.filters,
        setFilters: widget.setFilters,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selections',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  title: Text('Gluten-Free'),
                  value: widget.filters.glutenFree,
                  subtitle: Text('Only include gluten-free meals.'),
                  onChanged: (value) {
                    setState(() {
                      widget.filters.glutenFree = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegetarian'),
                  value: widget.filters.vegetarian,
                  subtitle: Text('Only include vegetarian meals.'),
                  onChanged: (value) {
                    setState(() {
                      widget.filters.vegetarian = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegan'),
                  value: widget.filters.vegan,
                  subtitle: Text('Only include vegan meals.'),
                  onChanged: (value) {
                    setState(() {
                      widget.filters.vegan = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Lactose-Free'),
                  value: widget.filters.lactoseFree,
                  subtitle: const Text('Only include lactose-free meals.'),
                  onChanged: (value) {
                    setState(() {
                      widget.filters.lactoseFree = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
