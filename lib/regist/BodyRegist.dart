import 'package:CalorieMate/Login/LoginPage.dart';
import 'package:CalorieMate/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:CalorieMate/registForm/regisFormPage.dart';
import 'package:CalorieMate/Class/UserData.dart';

class BodyRegist extends StatefulWidget {
  @override
  State<BodyRegist> createState() => _BodyRegistState();
}

class _BodyRegistState extends State<BodyRegist> {
  final AuthService _auth = AuthService();
  
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repeatPasswordController = TextEditingController();

  @override
    void dispose() {
      _emailController.dispose();
      _passwordController.dispose();
      super.dispose();
    }
    
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10), // Atur jarak kiri sebesar 8, sesuaikan sesuai kebutuhan
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
                  Padding(
                    padding: EdgeInsets.only(left: 10), // Atur jarak kiri sebesar 8, sesuaikan sesuai kebutuhan
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
                  SizedBox(height: 30,),
                  Padding(
                    padding: EdgeInsets.only(
                        left:
                            10), // Atur jarak kiri sebesar 8, sesuaikan sesuai kebutuhan
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Repeat Password",
                        style: TextStyle(
                            color: Color.fromARGB(255, 11, 0, 54),
                            fontSize: 15,
                            fontFamily: "Ken",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 11, 0, 54)),
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    child: TextField(
                      obscureText: true,
                      controller: _repeatPasswordController,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Color.fromARGB(255, 11, 0, 54)),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              )
            ),
            SizedBox(height: 50),

            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      // Validasi gender
                      if (_emailController.text.isEmpty || _passwordController.text.isEmpty || _repeatPasswordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please fill the form!'),
                          ),
                        );
                      } else if (_passwordController.text != _repeatPasswordController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Password does not match!'),
                          ),
                        );
                      } else if (_passwordController.text.length < 6) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Password should be at least 6 characters'),
                          ),
                        );
                      } else {
                        _signUp();
                        
                      }
                    });
                  },
                  child: Text(
                    'Create',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Ken",
                      fontSize: 14,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 11, 0, 54)),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(horizontal: 122, vertical: 15)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: "Ken",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration.zero, // Mengatur durasi transisi menjadi nol
                        pageBuilder: (_, __, ___) => LoginPage(),
                      ), // Navigasi ke halaman kedua
                    );
                  },
                  child: Text(
                    " Login",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Ken",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _signUp() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    try {
      UserAccount user = await _auth.signUpWithEmailAndPassword(email, password);
      if (user.email != "") {
        // Navigate using named routes
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration.zero,
            pageBuilder: (_, __, ___) => registFormPage(),
          ),
        );
      } else {
        print("The email address is already in use.");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('The email address is already in use.'),
          ),
        );
      }
    } catch (e) {
      // Handle registration errors here...
      print("Error during registration: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('The email address is already in use.'),
        ),
      );
    }
  }
}