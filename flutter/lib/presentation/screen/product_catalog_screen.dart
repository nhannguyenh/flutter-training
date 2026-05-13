import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/presentation/config/app_colors.dart';
import 'package:shopping_app/presentation/config/app_font_sizes.dart';

class ProductCatalogScreen extends StatelessWidget {
  const ProductCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Discover",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: AppFontSizes.fontSize_24
          ),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.bell)),
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.search),
                  prefixIconColor: Colors.grey,
                  hintText: "Search products, brands...",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none
                  ),
                  fillColor: Colors.grey.shade100,
                  filled: true
                ),
              ),

              SizedBox(height: 16),

              // Product Catalog
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildProductCatalogItem("All Items", true),
                    _buildProductCatalogItem("Electronics", false),
                    _buildProductCatalogItem("Fashion", false),
                    _buildProductCatalogItem("Beauty", false)
                  ],
                ),
              ),

              SizedBox(height: 32),

              // Product List
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: 4,
                itemBuilder: (context, index) => _buildProductCard(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: 0,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Shop"),
          BottomNavigationBarItem(icon: Icon(Icons.category_outlined), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: "Saved"),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: "Profile")
        ]
      ),
    );
  }

  Widget _buildProductCatalogItem(String catalogName, bool isSelected) {
    return Container(
      decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12)
      ),
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
      child: Text(
        catalogName,
        style: TextStyle(
            fontSize: AppFontSizes.fontSize_16,
            fontWeight: isSelected? FontWeight.bold : FontWeight.normal
        ),
      ),
    );
  }

  Widget _buildProductCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    "https://placehold.net/400x400.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.grey,
                  child: Icon(Icons.favorite_border, size: 20),
                )
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Text(
            "Glow Essentials Kit",
            style: TextStyle(
              fontSize: AppFontSizes.fontSize_14,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
        Text(
          "Beauty",
          style: TextStyle(color: Colors.grey),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                "\$45.00",
                style: TextStyle(
                  fontSize: AppFontSizes.fontSize_18,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Icon(Icons.add),
              )
            )
          ],
        )
      ],
    );
  }
}
