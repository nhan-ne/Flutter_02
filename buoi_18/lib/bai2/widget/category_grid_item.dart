import 'package:flutter/material.dart';

class CategoryGridItem extends StatelessWidget {
  final IconData icon;
  final String name;

  const CategoryGridItem({super.key, required this.icon, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(width: 0.5, color: Colors.grey[300]!),
            color: Colors.grey[200],
          ),
          child: Icon(icon, color: Color(0xff4a9eb6)),
        ),
        const SizedBox(height: 6),
        Text(name,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
      ],
    );
  }
}
