import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/di/injector.dart';
import 'package:shopping_app/presentation/screens/login/bloc/login_bloc.dart';
import 'package:shopping_app/presentation/screens/login/login_screen.dart';
import 'package:shopping_app/presentation/screens/product_catalog_screen.dart';
import 'package:shopping_app/presentation/screens/profile/bloc/user_profile_bloc.dart';
import 'package:shopping_app/presentation/screens/profile/bloc/user_profile_event.dart';
import 'package:shopping_app/presentation/screens/profile/profile_screen.dart';

abstract class AppRouter {
  static const String initialRoute = "/login";
  static const String productRoute = "/product";
  static const String userProfileRoute = "/user";

  static Map<String, Widget Function(BuildContext)> routes = {
    initialRoute: (context) => BlocProvider<LoginBloc>(
      create: (_) => injector<LoginBloc>(),
      child: LoginScreen(),
    ),
    productRoute: (context) => ProductCatalogScreen(),
    userProfileRoute: (context) => BlocProvider<UserProfileBloc>(
      create: (_) => injector<UserProfileBloc>()..add(FetchUserProfileData()),
      child: ProfileScreen(),
    ),
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouter.initialRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LoginBloc>(
            create: (_) => injector<LoginBloc>(),
            child: LoginScreen(),
          )
        );
      case AppRouter.productRoute:
        return MaterialPageRoute(
          builder: (context) {
            return ProductCatalogScreen();
          },
        );
      case AppRouter.userProfileRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<UserProfileBloc>(
            create: (_) => injector<UserProfileBloc>()..add(FetchUserProfileData()),
            child: const ProfileScreen(),
          ),
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
