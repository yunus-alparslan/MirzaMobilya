import 'package:flutter/material.dart';

class Malzeme {
  String ad;
  int adet;
  final double birimFiyat;

  Malzeme({required this.ad, required this.adet, required this.birimFiyat});

  double get toplamTutar => adet * birimFiyat;
}

class MalzemeListesiSayfasi extends StatefulWidget {
  const MalzemeListesiSayfasi({super.key});

  @override
  State<MalzemeListesiSayfasi> createState() => _MalzemeListesiSayfasiState();
}

class _MalzemeListesiSayfasiState extends State<MalzemeListesiSayfasi> {
  final List<Malzeme> malzemeler = [
    Malzeme(ad: 'Panel (18mm)', adet: 1, birimFiyat: 640.0),
    Malzeme(ad: 'Ray (45cm)', adet: 1, birimFiyat: 80.0),
    Malzeme(ad: 'Menteşe', adet: 1, birimFiyat: 45.0),
    Malzeme(ad: 'Vida (4mm)', adet: 1, birimFiyat: 2.5),
    Malzeme(ad: 'Kenar Bandi', adet: 2, birimFiyat: 412.33),
  ];

  // Genel toplamı hesapla
  double get genelToplam {
    double sum = 0;
    for (var item in malzemeler) {
      sum += item.toplamTutar;
    }
    return sum;
  }

  String _formatCurrency(double value) {
    return value
        .toStringAsFixed(2)
        .replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );
  }

  // Adet arttırma fonksiyonu
  void _adetArttir(int index) {
    setState(() {
      malzemeler[index].adet++;
    });
  }

  // Adet eksiltme fonksiyonu
  void _adetAzalt(int index) {
    setState(() {
      if (malzemeler[index].adet > 0) {
        malzemeler[index].adet--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text(
          "Malzeme",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Liste
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16.0),
              itemCount: malzemeler.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final item = malzemeler[index];
                return _buildMalzemeKarti(item, index);
              },
            ),
          ),
          // Toplam Alanı
          _buildToplamAlani(),
        ],
      ),
    );
  }

  Widget _buildMalzemeKarti(Malzeme item, int index) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Üst Kısım: İsim ve Fiyat
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    item.ad,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Text(
                  '₺${_formatCurrency(item.birimFiyat)}',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
            const Divider(height: 20, thickness: 1),
            // Alt Kısım: Adet Kontrol Butonları
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Adet:",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Row(
                  children: [
                    // Eksiltme Butonu
                    _buildControlButton(
                      icon: Icons.remove,
                      color: Colors.red[100],
                      iconColor: Colors.red,
                      onPressed: () => _adetAzalt(index),
                    ),
                    const SizedBox(width: 15),
                    // Adet Gösterimi
                    Text(
                      "${item.adet}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 15),
                    // Arttırma Butonu
                    _buildControlButton(
                      icon: Icons.add,
                      color: Colors.green[100],
                      iconColor: Colors.green,
                      onPressed: () => _adetArttir(index),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required Color? color,
    required Color? iconColor,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: Icon(icon, color: iconColor, size: 20),
      ),
    );
  }

  Widget _buildToplamAlani() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Toplam Maliyet:",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          Text(
            "₺${_formatCurrency(genelToplam)}",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
        ],
      ),
    );
  }
}
