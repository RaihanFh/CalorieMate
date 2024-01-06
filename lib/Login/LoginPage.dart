import 'package:CalorieMate/regist/registPage.dart';
import 'package:flutter/material.dart';
import 'BodyLogin.dart';

// Kelas LoginPage yang merupakan StatefulWidget
class LoginPage extends StatefulWidget {
  @override
  // Override method createState untuk membuat state dari LoginPage
  State<LoginPage> createState() => _LoginPageState();
}

// Private class _LoginPageState yang merupakan state dari LoginPage
class _LoginPageState extends State<LoginPage> {

  @override
  // Override method build untuk membuat tampilan halaman login
  Widget build(BuildContext context) {
    // Mengembalikan sebuah Scaffold dengan konfigurasi tertentu
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0), // Ubah tinggi AppBar di sini
        child: AppBar(
          title: Text(
            "Login", // Judul pada AppBar
            style: TextStyle(
                color: Color.fromARGB(255, 11, 0, 54), // Mengatur warna teks
                fontFamily: "Ken", // Mengatur jenis font
                fontSize: 25, // Mengatur ukuran teks
                fontWeight: FontWeight.bold), // Mengatur ketebalan teks
          ),
          backgroundColor: Colors.white,  // Mengatur warna latar belakang AppBar menjadi putih
          elevation: 0, // Menghilangkan bayangan pada AppBar
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 11, 0, 54)), // Tombol kembali dengan icon panah
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                transitionDuration: Duration.zero, // Mengatur durasi transisi menjadi nol
                pageBuilder: (_, __, ___) => registPage(), // Memanggil halaman registPage saat tombol ditekan
              ),
              );
            },
          ),
        ),
      ),
      body: Container(
        width: double.infinity, // Lebar container mengikuti lebar layar
        child: Column(
          children: <Widget>[
            SizedBox(height: 60), // Spacer kosong dengan tinggi 60
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Mengatur warna latar belakang container menjadi putih
                ),
                child: BodyLogin(), // Menampilkan tampilan BodyLogin di dalam container
              ),
            ),
            SizedBox(height: 10), // Spacer kosong dengan tinggi 10
            Align(
              alignment: Alignment.center, // Mengatur teks rata tengah
              child: Container(
                margin: EdgeInsets.only(bottom: 40, left: 30, right: 30),
                child: Text(
                  "By continuing, you agree to CalorieMate’s Terms & Conditions and Privacy Policy",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey, // Mengatur warna teks menjadi abu-abu
                    fontFamily: "Ken", // Mengatur jenis font
                    fontWeight: FontWeight.normal, // Mengatur ketebalan teks menjadi normal
                    fontSize: 13, // Mengatur ukuran teks
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}