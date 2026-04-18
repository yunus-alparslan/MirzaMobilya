import 'package:flutter/material.dart';
import 'package:mirzamobilya/AppSetting/AppSetting.dart';
import 'package:mirzamobilya/views/OrdersViews.dart';
import 'package:mirzamobilya/widgets/card_orders.dart';
import 'package:mirzamobilya/widgets/last_card_orders.dart';
import 'package:mirzamobilya/Service/NavigatorService.dart';

class Homepageviews extends StatefulWidget {
  const Homepageviews({super.key});
  @override
  State<StatefulWidget> createState() => _HomepageviewsState();
}

class _HomepageviewsState extends State<Homepageviews> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(AppSetting.homePageAppBarText)),
      body: Padding(
        padding: .all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardOrders(title: "Toplam Sipariş Sayısı", value: 12),
            CardOrders(title: "Bu Ayki Sipariş", value: 100),
            CardOrders(title: "Toplam Maliyet", value: 22),

            Padding(
              padding: .all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Son Siparişler",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Text("Tümü", style: TextStyle(fontWeight: FontWeight.w700)),
                ],
              ),
            ),

            LastCardOrders(
              orderPerson: "Ahmet Yılmaz",
              orderMade: "TV Ünitesi",
            ),

            LastCardOrders(
              orderPerson: "Ahmet Yılmaz",
              orderMade: "TV Ünitesi",
            ),

            LastCardOrders(
              orderPerson: "Ahmet Yılmaz",
              orderMade: "TV Ünitesi",
            ),

            // Orders Creater Button
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Sayfaya veri gönderme örneği
                    NavigationService.navigateTo(OrderViews());
                  },
                  child: Text("Sipariş Oluştur"),
                ),
              ],
            ),
            // Orders Creater Button
          ],
        ),
      ),
    );
  }
}
