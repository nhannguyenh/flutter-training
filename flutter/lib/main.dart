import 'package:flutter/material.dart';
import 'package:shopping_app/di/injector.dart';
import 'package:shopping_app/presentation/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}
