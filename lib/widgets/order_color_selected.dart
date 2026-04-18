import 'package:flutter/material.dart';

class OrderColorSelected extends StatefulWidget {
  @override
  State<OrderColorSelected> createState() => _OrderColorSelectedState();
}

class _OrderColorSelectedState extends State<OrderColorSelected> {
  String selectedColor = "Ceviz";

  final List<Map<String, dynamic>> colorOptions = [
    {"name": "Ceviz", "color": Color(0xFF7B5231)},
    {"name": "Meşe", "color": Color(0xFFD2B48C)},
    {"name": "Siyah", "color": Color(0xFF2B2B2B)},
    {"name": "Krem", "color": Color(0xFFF5F5DC)},
    {"name": "Kahve", "color": Color(0xFF8E3A32)},
  ];

  @override
  Widget build(BuildContext context) {
    // Scaffold ve SafeArea kaldırıldı, sadece Column döndürüyoruz
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Renk Seçimi",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: colorOptions.map((item) {
            return colorItem(item['name'], item['color']);
          }).toList(),
        ),
      ],
    );
  }

  Widget colorItem(String name, Color color) {
    bool isSelected = selectedColor == name;
    return GestureDetector(
      onTap: () => setState(() => selectedColor = name),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 40,
                height: 50,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.all(
                    Radius.elliptical(40, 50),
                  ),
                  border: Border.all(color: Colors.grey.withOpacity(0.3)),
                ),
              ),
              if (isSelected)
                const Icon(Icons.check, color: Colors.white, size: 18),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            name,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
