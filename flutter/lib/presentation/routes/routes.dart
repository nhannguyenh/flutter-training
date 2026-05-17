import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/di/injector.dart';
import 'package:shopping_app/presentation/screens/login/login_screen.dart';
import 'package:shopping_app/presentation/screens/product_catalog_screen.dart';
import 'package:shopping_app/presentation/screens/profile/bloc/user_profile_bloc.dart';
import 'package:shopping_app/presentation/screens/profile/profile_screen.dart';

abstract class AppRouter {
  static const String loginRoute = "/login";
  static const String productRoute = "/product";
  static const String userProfileRoute = "/user";

  static Map<String, Widget Function(BuildContext)> routes = {
    loginRoute: (context) => LoginScreen(),
    productRoute: (context) => ProductCatalogScreen(),
    userProfileRoute: (context) => ProfileScreen(),
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouter.loginRoute:
        return MaterialPageRoute(
          builder: (context) {
            return LoginScreen();
          },
        );
      case AppRouter.productRoute:
        return MaterialPageRoute(
          builder: (context) {
            return ProductCatalogScreen();
          },
        );
      case AppRouter.userProfileRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => injector<UserProfileBloc>(),
            child: const ProfileScreen(),
          )
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text("No route defined for ${settings.name}")),
          ),
        );
    }
  }
}
