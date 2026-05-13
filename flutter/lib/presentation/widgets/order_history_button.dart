import 'package:flutter/material.dart';

class OrderHistoryButton extends StatelessWidget {
  String title;
  bool isPrimary;
  IconData? icon;

  OrderHistoryButton({
    super.key,
    required this.title,
    required this.isPrimary,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary
              ? Colors.teal.shade800
              : Colors.grey.shade100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {},
        child: Row(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                color: Colors.white,
              ),
            ],
            Text(
              title,
              style: TextStyle(
                color: isPrimary ? Colors.white : Colors.grey.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
