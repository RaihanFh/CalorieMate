import 'package:CalorieMate/Login/LoginPage.dart';
import 'package:CalorieMate/MainFood/MainFoodPage.dart';
import 'package:CalorieMate/editProfleForm/editProfileFormPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:CalorieMate/HomePage/HomePage.dart';
import 'Body.dart';
import 'package:CalorieMate/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:CalorieMate/Class/UserData.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthService _auth = AuthService();
  // Controllers untuk field password
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _repeatPasswordController = TextEditingController();

  @override
  void dispose() {
    // Hapus controllers ketika widget tidak digunakan lagi
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserAccount>(context);
    return Scaffold(
       // Scaffold untuk halaman profil
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        // AppBar dengan styling khusus
        preferredSize: Size.fromHeight(70.0), // Ubah tinggi AppBar di sini
        child: AppBar(
          title: Text(
            "Profile",
            style: TextStyle(
                color: Color.fromARGB(255, 11, 0, 54),
                fontFamily: "Ken",
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            // IconButton untuk kembali
            icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 11, 0, 54)),
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration:
                      Duration.zero, // Mengatur durasi transisi menjadi nol
                  pageBuilder: (_, __, ___) => HomePage(),
                ), // Navigasi ke halaman kedua
              );
            },
          ),
          actions: [
            // PopupMenuButton untuk aksi tambahan seperti edit profil, ubah password, dan logout
            PopupMenuButton<String>(
              icon:
                  Icon(Icons.more_vert, color: Color.fromARGB(255, 11, 0, 54)),
              onSelected: (value) {
                if (value == 'edit_profile') {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration:
                          Duration.zero, // Mengatur durasi transisi menjadi nol
                      pageBuilder: (_, __, ___) => editProfileFormPage(),
                    ), // Ganti YourPage dengan halaman yang sesuai
                  );
                } else if (value == 'change_pw') {
                  // ChangePW2.show(context); // Ganti YourPage dengan halaman yang sesuai
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              20.0,
                            ),
                          ),
                        ),
                        contentPadding: EdgeInsets.only(
                          top: 10.0,
                        ),
                        title: Text(
                          "Change Password",
                          style: TextStyle(
                            color: Color.fromARGB(255, 11, 0, 54),
                            fontSize: 20,
                            fontFamily: "Ken",
                          ),
                        ),
                        content: Container(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "   Old Password",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 11, 0, 54),
                                      fontSize: 15,
                                      fontFamily: "Ken",
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              Color.fromARGB(255, 11, 0, 54)),
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  child: TextField(
                                    obscureText: true,
                                    controller: _oldPasswordController,
                                    decoration: InputDecoration(
                                        hintStyle: TextStyle(
                                            color:
                                                Color.fromARGB(255, 11, 0, 54)),
                                        border: InputBorder.none),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "   New Password",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 11, 0, 54),
                                      fontSize: 15,
                                      fontFamily: "Ken",
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              Color.fromARGB(255, 11, 0, 54)),
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  child: TextField(
                                    obscureText: true,
                                    controller: _newPasswordController,
                                    decoration: InputDecoration(
                                        hintStyle: TextStyle(
                                            color:
                                                Color.fromARGB(255, 11, 0, 54)),
                                        border: InputBorder.none),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "   Repeat New Password",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 11, 0, 54),
                                      fontSize: 15,
                                      fontFamily: "Ken",
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              Color.fromARGB(255, 11, 0, 54)),
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  child: TextField(
                                    obscureText: true,
                                    controller: _repeatPasswordController,
                                    decoration: InputDecoration(
                                        hintStyle: TextStyle(
                                            color:
                                                Color.fromARGB(255, 11, 0, 54)),
                                        border: InputBorder.none),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: TextButton(
                                    onPressed: () async {
                                      if (_oldPasswordController.text.isEmpty ||
                                          _newPasswordController.text.isEmpty ||
                                          _repeatPasswordController
                                              .text.isEmpty) {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text('Incomplete Form'),
                                                content: Text(
                                                    'Please fill all the password fields.'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(
                                                          context); // Close the dialog
                                                    },
                                                    child: Text('OK'),
                                                  ),
                                                ],
                                              );
                                            });
                                      } else if (_newPasswordController
                                              .text.length <
                                          6) {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text('Incomplete Form'),
                                                content: Text(
                                                    'Password should be at least 6 characters'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(
                                                          context); // Close the dialog
                                                    },
                                                    child: Text('OK'),
                                                  ),
                                                ],
                                              );
                                            });
                                      } else if (_newPasswordController.text !=
                                          _repeatPasswordController.text) {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text('Incomplete Form'),
                                                content: Text(
                                                    'Password does not match!'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(
                                                          context); // Close the dialog
                                                    },
                                                    child: Text('OK'),
                                                  ),
                                                ],
                                              );
                                            });
                                      } else {
                                        print("masuk ke else");

                                        bool userT = await _auth.changePassword(
                                            user.email!,
                                            _oldPasswordController.text,
                                            _newPasswordController.text);
                                        if (userT) {
                                          print("Password changed");
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  'Password changed successfully'),
                                            ),
                                          );
                                          Navigator.pop(context);
                                        } else {
                                          print("Password change fail");
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content:
                                                  Text('Password change fail'),
                                            ),
                                          );
                                        }
                                      }
                                      ;
                                    },
                                    child: Text(
                                      'Submit',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Ken",
                                        fontSize: 15,
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color.fromARGB(255, 11, 0, 54)),
                                      padding: MaterialStateProperty.all<
                                              EdgeInsetsGeometry>(
                                          EdgeInsets.symmetric(
                                              horizontal: 110, vertical: 15)),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (value == 'logout') {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration:
                          Duration.zero, // Mengatur durasi transisi menjadi nol
                      pageBuilder: (_, __, ___) => LoginPage(),
                    ), // Ganti YourPage dengan halaman yang sesuai
                  );
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: 'edit_profile',
                    child: Text('Edit Profile'),
                  ),
                  PopupMenuItem(
                    value: 'change_pw',
                    child: Text('Change Password'),
                  ),
                  PopupMenuItem(
                    value: 'logout',
                    child: Text('Logout'),
                  ),
                ];
              },
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Bodyy(),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
            horizontal: 20), // Atur padding sesuai kebutuhan
        height: 60, // Atur tinggi sesuai kebutuhan
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 11, 0, 54), // Atur warna sesuai kebutuhan
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration:
                        Duration.zero, // Mengatur durasi transisi menjadi nol
                    pageBuilder: (_, __, ___) => MainFoodPage(),
                  ),
                );
              },
              icon: Icon(Icons.featured_play_list_outlined),
              color: Colors.white70, // Atur warna ikon sesuai kebutuhan
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration:
                        Duration.zero, // Mengatur durasi transisi menjadi nol
                    pageBuilder: (_, __, ___) => HomePage(),
                  ),
                );
              },
              icon: Icon(Icons.home),
              color: Colors.white70,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.account_circle_outlined),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
