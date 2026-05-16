import 'package:flutter/material.dart';
import 'package:shopping_app/presentation/screens/login_screen.dart';
import 'package:shopping_app/presentation/screens/product_catalog_screen.dart';

abstract class AppRouter {
  static const String loginRoute = "/login";
  static const String productRoute = "/product";

  static Map<String, Widget Function(BuildContext)> routes = {
    loginRoute: (context) => LoginScreen(),
    productRoute: (context) => ProductCatalogScreen()
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouter.loginRoute:
        return MaterialPageRoute(
            builder: (context) {
              return LoginScreen();
            }
        );
      default:
        return MaterialPageRoute(builder: (_) =>
            Scaffold(
              body: Center(
                  child: Text("No route defined for ${settings.name}")),
            ));
    }
  }
}