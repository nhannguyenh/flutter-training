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
          bottom: TabBar(
            unselectedLabelColor: Colors.grey.shade600,
            labelColor: Colors.teal.shade800,
            indicatorColor: Colors.teal.shade800,
            tabs: [
              Tab(text: "All Orders"),
              Tab(text: "Ongoing"),
              Tab(text: "Completed"),
              Tab(text: "Cancelled"),
            ]
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text("All Orders")),
            Center(child: Text("Ongoing")),
            Center(child: Text("Completed")),
            Center(child: Text("Cancelled"))
          ]
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: 2,
          selectedItemColor: Colors.teal.shade800,
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Explore"),
            BottomNavigationBarItem(icon: Icon(Icons.event_note_rounded), label: "Orders"),
            BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: "Profile")
          ]
        ),
      )
    );
  }
}
