import 'package:flutter/material.dart';
import 'package:shopping_app/presentation/config/app_font_sizes.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Order History"),
          titleTextStyle: TextStyle(
            fontSize: AppFontSizes.fontSize_20,
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
          centerTitle: true,
          leading: Icon(Icons.arrow_back),
          actions: [
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.search, size:28)
            )
          ],
        ),
      )
    );
  }
}
