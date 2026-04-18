import 'package:flutter/material.dart';

class Malzeme {
  final String ad;
  final int adet;
  final double birimFiyat;

  Malzeme({required this.ad, required this.adet, required this.birimFiyat});

  double get toplamTutar => adet * birimFiyat;
}
