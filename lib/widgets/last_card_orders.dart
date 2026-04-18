import 'package:flutter/material.dart';

class LastCardOrders extends StatefulWidget {
  //final String image;
  final String orderPerson;
  final String orderMade;

  const LastCardOrders({
    super.key,
    required this.orderPerson,
    required this.orderMade,
  });

  @override
  State<LastCardOrders> createState() => _LastCardOrdersState();
}

class _LastCardOrdersState extends State<LastCardOrders> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "2.222 TL",
              style: TextStyle(color: Colors.green, fontWeight: .bold),
            ),
            Text("2 Saat Önce"),
          ],
        ),
        leading: Icon(Icons.ac_unit),
        title: Text(widget.orderMade),
        subtitle: Text(widget.orderPerson),
      ),
    );
  }
}
