import 'package:go_router/go_router.dart';
import 'package:meals_app/models/filters.dart';
import 'package:meals_app/screens/category_meal_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

import 'models/meal.dart';

//Routing table for navigating pages
GoRouter goRouterTable = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const TabsScreen(),
      routes: [

        GoRoute(
          path: 'filters',
          builder: (context, state) {
            List args = state.extra as List;
            return FilterScreen(
              filters: args[0] as Filters,
              setFilters: args[1] as Function,
            );
          },
        ),
      ],
    ),
        GoRoute(
          path: '/category_details',
          builder: (context, state) {
            Map<String, String> args = state.extra as Map<String, String>;
            return CategoryMealScreen(
              id: args['id']!,
              categoryTitle: args['title']!,
            );
          },
        ),
        GoRoute(
          path: '/meal_details',
          builder: (context, state) {
            return MealDetailScreen(meal: state.extra as Meal);
          },
        ),
  ],
);
