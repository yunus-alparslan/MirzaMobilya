import 'package:flutter/material.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<void> navigateTo(Widget screen) async {
    // önce mevcut durumun (state) null olup olmadığını kontrol ediyoruz
    final currentState = navigatorKey.currentState;

    if (currentState != null) {
      currentState.push(MaterialPageRoute(builder: (context) => screen));
    } else {
      // Hata durumunda konsola yazar, uygulamayı çökertmez
      debugPrint("Hata: Navigator henüz hazır değil veya bağlanamadı.");
    }
  }

  // Geri dönme fonksiyonu (Güvenli Versiyon)
  static void goBack() {
    final currentState = navigatorKey.currentState;

    if (currentState != null) {
      currentState.pop();
    }
  }

  static void navigateToAndRemoveAll(Widget screen) {
    final currentState = navigatorKey.currentState;

    if (currentState != null) {
      currentState.pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => screen),
        (route) => false,
      );
    }
  }
}
