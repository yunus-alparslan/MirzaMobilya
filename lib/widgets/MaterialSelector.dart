import 'package:flutter/material.dart';

class MaterialSelector extends StatefulWidget {
  const MaterialSelector({super.key});

  @override
  State<MaterialSelector> createState() => _MaterialSelectorState();
}

class _MaterialSelectorState extends State<MaterialSelector> {
  int selectedIndex = 0;

  final List<String> materials = ["MDF", "Laminat", "Masif", "Melamin"];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // ekran küçülürse padding otomatik küçülsün
    final horizontalPadding = width < 360 ? 10.0 : 12.0;
    final verticalPadding = width < 360 ? 6.0 : 8.0;
    final fontSize = width < 360 ? 12.0 : 13.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),

        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(materials.length, (index) {
            final isSelected = selectedIndex == index;

            return ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 70, // chip minimum genişlik
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                borderRadius: BorderRadius.circular(10),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: verticalPadding,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.brown : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isSelected ? Colors.brown : Colors.grey.shade300,
                    ),
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      materials[index],
                      style: TextStyle(
                        fontSize: fontSize,
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
