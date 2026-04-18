import 'package:flutter/material.dart';
import 'package:mirzamobilya/Models/OrdersModel.dart';
import 'package:mirzamobilya/Service/NavigatorService.dart';
import 'package:mirzamobilya/views/CustomerViewsDelay.dart';

class GridTable extends StatefulWidget {
  const GridTable({super.key});

  @override
  State<GridTable> createState() => _GridTableState();
}

class _GridTableState extends State<GridTable> {
  Ordersmodel ord = Ordersmodel();
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: ord.ordersName.length,
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          bool isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
                NavigationService.navigateTo(CustomerViewsDelay());
              });
            },
            child: Card(
              color: isSelected ? Colors.brown : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(
                  color: isSelected ? Colors.brown : Colors.grey.shade300,
                  width: 2,
                ),
              ),
              child: Center(
                child: Text(
                  ord.ordersName[index],

                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
