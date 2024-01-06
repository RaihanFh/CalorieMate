import 'package:flutter/material.dart';
import 'package:CalorieMate/services/Wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';  // File ini seharusnya berisi konfigurasi Firebase, pastikan konfigurasinya benar.

import 'package:provider/provider.dart';
import 'package:CalorieMate/Class/UserData.dart';
import 'package:CalorieMate/services/auth.dart';

// Fungsi main yang akan dijalankan pertama kali saat aplikasi dimulai.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inisialisasi Firebase dengan opsi default.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Menjalankan aplikasi Flutter.
  runApp(MyApp());
}

// Kelas utama yang merupakan root dari seluruh aplikasi.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // Menggunakan StreamProvider untuk memantau perubahan status autentikasi pengguna.
   return StreamProvider<UserAccount?>(
      create: (context) => AuthService().user,
      initialData: null,  // Data awal ketika aplikasi pertama kali dijalankan.
      child: MaterialApp(
        debugShowCheckedModeBanner: false,  // Menyembunyikan banner debug di mode pengembangan.
        home: Wrapper(),  // Wrapper bertanggung jawab untuk menentukan tampilan berdasarkan status autentikasi.
      ),
    );
  }
}
