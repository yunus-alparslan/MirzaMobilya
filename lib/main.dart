import 'package:flutter/material.dart';
import 'package:mirzamobilya/views/HomePageViews.dart';
import 'package:mirzamobilya/views/MaterialViews.dart';

// main.dart dosyası

import 'package:flutter/material.dart';
// 1. ADIM: Servisi mutlaka import et!
import 'package:mirzamobilya/Service/NavigatorService.dart';
import 'package:mirzamobilya/views/SummaryViews.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mirza Mobilya',
      debugShowCheckedModeBanner: false,

      navigatorKey: NavigationService.navigatorKey,
      home: Homepageviews(),
    );
  }
}
