import 'package:ecommerce_app_flutter_nodejs/common/widget/bottom_navigation_bar.dart';
import 'package:ecommerce_app_flutter_nodejs/features/auth/screens/auth_screen.dart';
import 'package:ecommerce_app_flutter_nodejs/features/home/screen/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Text("Error 404!\n Not Found!"),
        ),
      );
  }
}
