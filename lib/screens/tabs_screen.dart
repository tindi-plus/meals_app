import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favourites_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import '../models/filters.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({
    super.key,
  });
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavouritesScreen(), 'title': 'Your Favourites'}
  ];

  Filters filters = Filters();

  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[selectedPage]['title'] as String),
      ),
      drawer: MainDrawer(
        filters: filters,
        setFilters: _setFilters, 
      ),
      body: _pages[selectedPage]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.yellowAccent,
        currentIndex: selectedPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }

  void _selectPage(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  void _setFilters(Filters newFilters) {
    setState(() {
      filters = newFilters;
      print('New filters set');
    });
  }
}
