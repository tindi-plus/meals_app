import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/models/filters.dart';

class MainDrawer extends StatelessWidget {
  Filters filters;
  Function setFilters;

  MainDrawer({super.key, required this.filters, required this.setFilters});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.yellowAccent,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            'Meals',
            Icons.restaurant,
            () {
              print('Gone to Home Page');
              context.pop();
            },
          ),
          buildListTile(
            'Filters',
            Icons.settings,
            () {
              context.push(
                '/filters',
                extra: [filters, setFilters],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildListTile(
    String title,
    IconData icon,
    VoidCallback tapHandler,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        size: 27,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }
}
