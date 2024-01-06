import 'package:flutter/material.dart';
import 'BodyBMIDetail.dart'; // Impor file yang berisi widget untuk menampilkan detail BMI

class BMIDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Latar belakang halaman putih
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0), 
        child: AppBar(
          title: Text(
            "BMI Details", // Judul AppBar: "BMI Details"
            style: TextStyle(
                color: Color.fromARGB(255, 11, 0, 54), // Warna teks judul
                fontFamily: "Ken", // Font family judul
                fontSize: 25, // Ukuran font judul
                fontWeight: FontWeight.bold), // Tebal font judul
          ),
          backgroundColor: Colors.white, // Warna latar belakang AppBar putih
          elevation: 0, // Elevation/shadow pada AppBar dihilangkan
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 11, 0, 54)), // Tombol kembali dengan ikon panah ke belakang
            onPressed: () {
              Navigator.pop(context,); // Aksi ketika tombol kembali ditekan, kembali ke halaman sebelumnya
            },
          ),
        ),
      ),
      body: Container(
        width: double.infinity, // Lebar Container mengisi seluruh lebar layar
        child: Column(
          children: <Widget>[
            SizedBox(height: 10), // Spasi atas sebesar 10 piksel
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Warna latar belakang Container putih
                ),
                child: BodyBMIDetail(), // Widget BodyBMIDetail untuk menampilkan detail BMI
              ),
            ),
          ],
        ),
      ),
    );
  }
}
