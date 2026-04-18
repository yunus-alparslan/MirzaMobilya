import 'package:flutter/material.dart';
import 'package:mirzamobilya/widgets/grid_table.dart';

class OrderViews extends StatefulWidget {
  const OrderViews({super.key});

  @override
  State<StatefulWidget> createState() => _OrderViewsState();
}

class _OrderViewsState extends State<OrderViews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Yeni Sipariş",
          style: TextStyle(color: Colors.brown, fontWeight: .w700),
        ),
      ),
      body: Padding(padding: .all(10), child: GridTable()),
    );
  }
}
