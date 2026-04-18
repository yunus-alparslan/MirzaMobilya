import 'package:flutter/material.dart';

class Ordersmodel {
  List<String> ordersName = [
    "Tv Ünitesi",
    "Dolap",
    "Sehpa",
    "Masa",
    "Kitaplık",
    "Özel Ürün",
  ];
}

class SiparisBilgisi {
  final String urunAdi;
  final String musteriAdi;
  final String olculer;
  final String renk;
  final String malzemeTipi;

  SiparisBilgisi({
    required this.urunAdi,
    required this.musteriAdi,
    required this.olculer,
    required this.renk,
    required this.malzemeTipi,
  });
}
