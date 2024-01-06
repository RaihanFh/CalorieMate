import 'package:CalorieMate/HomePage/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:CalorieMate/services/auth.dart';
import 'package:CalorieMate/Class/UserData.dart';

// Mendefinisikan class BodyLogin yang merupakan StatefulWidget
class BodyLogin extends StatefulWidget {
  @override
  // Override method createState untuk membuat state dari BodyLogin
  State<BodyLogin> createState() => _BodyLoginState();
}

// Private class _BodyLoginState yang merupakan state dari BodyLogin
class _BodyLoginState extends State<BodyLogin> {

  final AuthService _auth = AuthService(); // Instance dari AuthService untuk otentikasi

  TextEditingController _emailController = TextEditingController(); // Kontroller untuk field email
  TextEditingController _passwordController = TextEditingController(); // Kontroller untuk field password

  @override
    void dispose() {
      // Memusnahkan kontroler saat tidak dibutuhkan untuk mencegah kebocoran memori
      _emailController.dispose();
      _passwordController.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    // Membuat tata letak untuk halaman login
    return Padding(
      padding: EdgeInsets.all(30),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 40,),
            // Kontainer untuk email dan password
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: <Widget>[
                  // Label untuk kolom email
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Email",
                        style: TextStyle(
                            color: Color.fromARGB(255, 11, 0, 54),
                            fontSize: 15,
                            fontFamily: "Ken",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  // Input field untuk email
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 11, 0, 54)),
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Color.fromARGB(255, 11, 0, 54)), 
                          border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  // Label untuk kolom password
                  Padding(
                    padding: EdgeInsets.only(left:10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Password",
                        style: TextStyle(
                            color: Color.fromARGB(255, 11, 0, 54),
                            fontSize: 15,
                            fontFamily: "Ken",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  // Input field untuk password
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 11, 0, 54)),
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    child: TextField(
                      obscureText: true,
                      controller: _passwordController,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Color.fromARGB(255, 11, 0, 54)),
                          border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              )
            ),
            SizedBox(height: 50,),
            // Tombol untuk login
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      // Memeriksa apakah field email dan password kosong sebelum login
                      if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please fill the Email and Password!'),
                          ),
                        );
                      } else {
                        _signIn(); // Memanggil fungsi sign-in jika email dan password terisi
                      }
                    });
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Ken",
                      fontSize: 16,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 11, 0, 54)),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(horizontal: 122, vertical: 15)
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),
          ],
        ),
      ),
    );
  }
// Metode untuk menangani proses sign-in
  void _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;
// Mencoba untuk sign-in dengan email dan password yang diberikan
    UserAccount? user = await _auth.signInWithEmailAndPassword(email, password);
    print(user);
    if (user != null){
      print("User logged successfully");
       // Navigasi ke HomePage ketika login berhasil
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: Duration.zero,
          pageBuilder: (_, __, ___) => HomePage(),
        ),
      );
    }
    else{
      print("The the email or password is incorrect.");
       // Menampilkan pesan kesalahan jika login gagal
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('The the email or password is incorrect.'),
        ),
      );
    }
  }
}

