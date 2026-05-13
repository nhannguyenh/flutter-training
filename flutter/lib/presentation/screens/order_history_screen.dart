import 'package:flutter/material.dart';
import 'package:shopping_app/presentation/widgets/order_history_button.dart';
import 'package:shopping_app/presentation/widgets/order_history_cart.dart';

import '../configs/app_font_sizes.dart';

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
            _buildOrderList(),
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

  Widget _buildOrderList() {
    return Container(
      color: Colors.grey.shade200,
      child: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Column(
            spacing: 16,
            children: [
              OrderHistoryCart(
                orderId: "#ORD-92034",
                orderStatus: "DELIVERED",
                imageUrl: "https://placehold.net/400x400.png",
                date: "Placed on Oct 24, 2023",
                price: 128.50,
                buttons: [
                  OrderHistoryButton(title: "Reorder", isPrimary: true),
                  OrderHistoryButton(title: "View Details", isPrimary: false)
                ],
              ),
              OrderHistoryCart(
                orderId: "#ORD-88120",
                orderStatus: "SHIPPED",
                imageUrl: "https://placehold.net/400x400.png",
                date: "Expected by Oct 28, 2023",
                price: 45.00,
                buttons: [
                  OrderHistoryButton(
                    title: "Track Order",
                    isPrimary: true,
                    icon: Icons.local_shipping_outlined,
                  ),
                ],
                showMore: true,
              ),
              OrderHistoryCart(
                orderId: "#ORD-77541",
                orderStatus: "DELIVERED",
                imageUrl: "https://placehold.net/400x400.png",
                date: "Delivered on Sep 15, 2023",
                price: 210.00,
                buttons: [
                  OrderHistoryButton(title: "Leave Review", isPrimary: false),
                  OrderHistoryButton(title: "Buy Again", isPrimary: false)
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
