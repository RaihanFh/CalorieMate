import 'package:CalorieMate/HomePage/HomePage.dart';
// import 'package:CalorieMate/Login/forgotPasswordInsertUsername.dart';
import 'package:flutter/material.dart';
import 'package:CalorieMate/services/auth.dart';
import 'package:CalorieMate/Class/UserData.dart';

class BodyLogin extends StatefulWidget {
  @override
  State<BodyLogin> createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {

  final AuthService _auth = AuthService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
            SizedBox(height: 40,),
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
                    padding: EdgeInsets.only(left:10), // Atur jarak kiri sebesar 8, sesuaikan sesuai kebutuhan
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
                ],
              )
            ),
            SizedBox(height: 50,),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please fill the Email and Password!'),
                          ),
                        );
                      } else {
                        _signIn();
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
            // GestureDetector(
            //   onTap: () {
            //     ShowDataAlert.show(context);
            //   },
            //   child: Text(
            //     "Forgot Password?",
            //     style: TextStyle(
            //       color: Colors.grey,
            //       fontFamily: "Ken",
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  void _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    UserAccount? user = await _auth.signInWithEmailAndPassword(email, password);
    print(user);
    if (user != null){
      print("User logged successfully");
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('The the email or password is incorrect.'),
        ),
      );
    }
  }
}
