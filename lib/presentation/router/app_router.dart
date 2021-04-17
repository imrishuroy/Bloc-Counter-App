import 'package:counter_app/presentation/screens/home_page.dart';
import 'package:counter_app/presentation/screens/second_screen.dart';
import 'package:counter_app/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  //final _counterCubit = CounterCubit();
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
        break;
      case '/second':
        return MaterialPageRoute(
          builder: (_) => SecondScreen(),
        );
        break;
      case '/third':
        return MaterialPageRoute(
          builder: (_) => ThirdScreen(),
        );
        break;
      default:
        return null;
    }
  }

  // void dispose() {
  //   _counterCubit.close();
  // }
}
