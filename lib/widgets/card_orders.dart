import 'package:flutter/material.dart';

class CardOrders extends StatefulWidget {
  final String title;
  final int value;

  const CardOrders({super.key, required this.title, required this.value});

  @override
  State<CardOrders> createState() => _CardOrdersState();
}

class _CardOrdersState extends State<CardOrders> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        subtitle: Text(widget.title, textAlign: TextAlign.center),
        title: Text(widget.value.toString(), textAlign: TextAlign.center),
        onTap: () => print("tıklandı"),
      ),
    );
  }
}
