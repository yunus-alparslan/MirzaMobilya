import 'package:flutter/material.dart';
import 'package:mirzamobilya/widgets/MaterialSelector.dart';
import 'package:mirzamobilya/widgets/customer_textfield.dart';
import 'package:mirzamobilya/widgets/dimensions.dart';
import 'package:mirzamobilya/widgets/order_color_selected.dart';

class CustomerViewsDelay extends StatefulWidget {
  const CustomerViewsDelay({super.key});

  @override
  State<CustomerViewsDelay> createState() => _CustomerViewsDelayState();
}

class _CustomerViewsDelayState extends State<CustomerViewsDelay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sipariş Oluştur")),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 12),
            CustomerTextField(
              labelTextField: "Müşteri Adı",
              labelHintText: "Müşteri Adı Giriniz",
              tes: const Icon(Icons.person),
            ),

            CustomerTextField(
              labelTextField: "Sipariş Notu",
              labelHintText: "Özel Ölçü...",
              tes: const Icon(Icons.note),
            ),

            OrderColorSelected(),
            const SizedBox(height: 16),

            const Text(
              "Ölçüler (cm)",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            /// Ölçüler
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Dimensions(dimensionsLabel: "cm", dimensionsvalue: 120),
                Dimensions(dimensionsLabel: "boy", dimensionsvalue: 2),
                Dimensions(dimensionsLabel: "derinlik", dimensionsvalue: 2),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "Malzeme Tipi",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            MaterialSelector(),
          ],
        ),
      ),
    );
  }
}
