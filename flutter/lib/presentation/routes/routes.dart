import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/di/injector.dart';
import 'package:shopping_app/presentation/screens/order_history_screen.dart';
import 'package:shopping_app/presentation/screens/product/bloc/product_catalog_bloc.dart';
import 'package:shopping_app/presentation/screens/product/bloc/product_catalog_event.dart';
import 'package:shopping_app/presentation/screens/product/product_catalog_screen.dart';
import 'package:shopping_app/presentation/screens/profile/bloc/user_profile_bloc.dart';
import 'package:shopping_app/presentation/screens/profile/bloc/user_profile_event.dart';
import 'package:shopping_app/presentation/screens/profile/profile_screen.dart';

import '../screens/auth/bloc/auth_bloc.dart';
import '../screens/auth/login_screen.dart';

abstract class AppRouter {
  static const String initialRoute = "/login";
  static const String productRoute = "/product";
  static const String userProfileRoute = "/user";
  static const String orderHistoryRoute = "/order";

  static Map<String, Widget Function(BuildContext)> routes = {
    initialRoute: (context) => BlocProvider<AuthBloc>(
      create: (_) => injector<AuthBloc>(),
      child: LoginScreen(),
    ),
    productRoute: (context) => BlocProvider<ProductCatalogBloc>(
      create: (_) => injector<ProductCatalogBloc>()..add(FetchProductCatalogData()),
      child: ProductCatalogScreen(),
    ),
    userProfileRoute: (context) => MultiBlocProvider(
      providers: [
        BlocProvider<UserProfileBloc>(
          create: (_) => injector<UserProfileBloc>()..add(FetchUserProfileData()),
        ),
        BlocProvider(
          create: (_) => injector<AuthBloc>(),
        )
      ],
      child: const ProfileScreen()
    ),
    orderHistoryRoute: (context) => OrderHistoryScreen()
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouter.initialRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AuthBloc>(
            create: (_) => injector<AuthBloc>(),
            child: LoginScreen(),
          )
        );
      case AppRouter.productRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => injector<ProductCatalogBloc>()..add(FetchProductCatalogData()),
            child: ProductCatalogScreen(),
          )
        );
      case AppRouter.userProfileRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<UserProfileBloc>(
                create: (_) => injector<UserProfileBloc>()..add(FetchUserProfileData()),
              ),
              BlocProvider(
                create: (_) => injector<AuthBloc>(),
              )
            ],
            child: const ProfileScreen()
          ),
        );
      case AppRouter.orderHistoryRoute:
        return MaterialPageRoute(
          builder: (context) {
            return OrderHistoryScreen();
          }
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
