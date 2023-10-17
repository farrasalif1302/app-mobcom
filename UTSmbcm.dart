import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MataKuliah {
  final String nama;
  final String gambar;
  final int sks;

  MataKuliah({required this.nama, required this.gambar, required this.sks});
}

List<MataKuliah> daftarMataKuliah = [
  MataKuliah(nama: "Matematika Dasar", gambar: "assets/mata_kuliah1.png", sks: 3),
  MataKuliah(nama: "Fisika Dasar", gambar: "assets/mata_kuliah2.png", sks: 4),
  // Tambahkan mata kuliah lainnya di sini
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Daftar Mata Kuliah"),
        ),
        body: MataKuliahTable(),
      ),
    );
  }
}

class MataKuliahTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 2.5,
      ),
      itemCount: daftarMataKuliah.length,
      itemBuilder: (ctx, index) {
        return MataKuliahItem(daftarMataKuliah[index]);
      },
    );
  }
}

class MataKuliahItem extends StatelessWidget {
  final MataKuliah mataKuliah;

  MataKuliahItem(this.mataKuliah);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          Image.asset(
            mataKuliah.gambar,
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          Text(mataKuliah.nama),
          Text("SKS: ${mataKuliah.sks}"),
        ],
      ),
    );
  }
}
