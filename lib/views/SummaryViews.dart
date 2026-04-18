import 'package:flutter/material.dart';
import 'package:mirzamobilya/Models/MaterialModel.dart';
import 'package:mirzamobilya/Models/OrdersModel.dart';

class SiparisOzetiSayfasi extends StatelessWidget {
  // Örnek Sipariş Verisi
  final SiparisBilgisi siparis = SiparisBilgisi(
    urunAdi: "TV Ünitesi",
    musteriAdi: "Ahmet Yılmaz",
    olculer: "120 x 180 x 45 cm",
    renk: "Ceviz",
    malzemeTipi: "MDF",
  );

  // Örnek Malzeme Listesi
  final List<Malzeme> malzemeler = [
    Malzeme(
      ad: 'Panel (18mm)',
      adet: 2,
      birimFiyat: 300.0,
    ), // Fiyatlar örneğe göre güncellendi
    Malzeme(ad: 'Ray (45cm)', adet: 4, birimFiyat: 85.0), // 4 * 85 = 340
    Malzeme(ad: 'Menteşe', adet: 8, birimFiyat: 45.0),
    Malzeme(ad: 'Vida (4mm)', adet: 20, birimFiyat: 2.5),
    Malzeme(ad: 'Kenar Bandi', adet: 3, birimFiyat: 400.0),
  ];

  // Genel Toplam Hesaplama
  double get genelToplam {
    double sum = 0;
    for (var item in malzemeler) {
      sum += item.toplamTutar;
    }
    return sum;
  }

  // Para birimi formatlama
  String _formatCurrency(double value) {
    return value
        .toStringAsFixed(2)
        .replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text(
          "Sipariş Özeti",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Geri dönme işlemi
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Kısım: Sipariş Bilgileri Kartı
            _buildSiparisBilgileriCard(),

            const SizedBox(height: 20),

            // 2. Kısım: Kullanılan Malzemeler Başlığı
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Kullanılan Malzemeler",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // 3. Kısım: Malzeme Listesi
            _buildMalzemeListesi(),

            const SizedBox(height: 20),

            // 4. Kısım: Toplam Tutar
            _buildToplamAlani(),

            const SizedBox(height: 30), // Alt boşluk
          ],
        ),
      ),
    );
  }

  // Sipariş Bilgileri Kartı Tasarımı
  Widget _buildSiparisBilgileriCard() {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          _buildInfoRow(Icons.tv, "Ürün", siparis.urunAdi),
          const Divider(height: 25),
          _buildInfoRow(Icons.person, "Müşteri", siparis.musteriAdi),
          const Divider(height: 25),
          _buildInfoRow(Icons.straighten, "Ölçüler", siparis.olculer),
          const Divider(height: 25),
          _buildInfoRow(Icons.palette, "Renk", siparis.renk),
          const Divider(height: 25),
          _buildInfoRow(Icons.category, "Malzeme", siparis.malzemeTipi),
        ],
      ),
    );
  }

  // Bilgi Satırı Yardımcı Fonksiyonu
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.blue[900], size: 20),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Malzeme Listesi (Read-Only / Sadece Okuma)
  Widget _buildMalzemeListesi() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: ListView.separated(
        shrinkWrap: true, // Listeyi içeriğe göre sığdır
        physics:
            const NeverScrollableScrollPhysics(), // Ana scroll ile hareket etsin
        itemCount: malzemeler.length,
        separatorBuilder: (context, index) =>
            const Divider(height: 1, indent: 16, endIndent: 16),
        itemBuilder: (context, index) {
          final item = malzemeler[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            title: Text(
              item.ad,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            trailing: Text(
              "x${item.adet}   ₺${_formatCurrency(item.toplamTutar)}",
              style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
      ),
    );
  }

  // Toplam Tutar Alanı
  Widget _buildToplamAlani() {
    return Container(
      margin: const .symmetric(horizontal: 16.0),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue[900], // Arka plan rengi koyu mavi
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "TOPLAM:",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white70,
            ),
          ),
          Text(
            "₺${_formatCurrency(genelToplam)}",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
