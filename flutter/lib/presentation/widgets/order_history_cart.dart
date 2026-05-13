import 'package:flutter/material.dart';
import 'package:shopping_app/presentation/widgets/order_history_button.dart';

import '../configs/app_font_sizes.dart';

class OrderHistoryCart extends StatelessWidget {
  String orderId;
  String orderStatus;
  String imageUrl;
  String date;
  double price;
  List<OrderHistoryButton> buttons;
  bool showMore;

  OrderHistoryCart({
    super.key,
    required this.orderId,
    required this.orderStatus,
    required this.imageUrl,
    required this.date,
    required this.price,
    required this.buttons,
    this.showMore = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade400)
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "ORDER $orderId",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade500,
                            fontSize: AppFontSizes.fontSize_12
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green.shade200,
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: Text(
                            orderStatus,
                            style: TextStyle(
                              fontSize: AppFontSizes.fontSize_10,
                              fontWeight: FontWeight.bold,
                              color: Colors.green.shade900
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        "\$${price.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppFontSizes.fontSize_16
                        ),
                      ),
                    ),
                    Text(
                      date,
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: AppFontSizes.fontSize_12
                      ),
                    )
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(12),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: 80,
                  height: 80,
                ),
              )
            ],
          ),
          SizedBox(height: 16),
          Row(
            spacing: 8,
            children: [
              ...buttons.map((btn) => Expanded(child: btn)),
              if (showMore)
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.more_horiz, color: Colors.black54),
                ),
            ],
          )
        ],
      ),
    );
  }
}
