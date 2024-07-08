import 'package:flicks_time/src/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static final Map<String, WidgetBuilder> routes = {
    '': (context) => const SplashScreen(),
    'home': (context) => const HomeScreen(),
    'movie': (context) => const MovieScreen(),
    'movies': (context) => const MoviesScreen(),
    'settings': (context) => const SettingsScreen(),
    'about': (context) => const AboutScreen(),
    // '/settings': (context) => SettingsScreen(),
    // Añade más rutas aquí
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    if (routes.containsKey(settings.name)) {
      return MaterialPageRoute(
          builder: routes[settings.name]!, maintainState: false);
    } else {
      return MaterialPageRoute(builder: (context) => const NotFoundScreen());
    }
  }
}
