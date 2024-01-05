import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:CalorieMate/services/Database.dart';
import 'package:CalorieMate/Class/UserData.dart';
import 'package:provider/provider.dart';
import 'package:CalorieMate/Class/BMI_Data.dart';
import 'dart:io';
import 'package:CalorieMate/services/varGlobal.dart';

class BodyEditProfile extends StatefulWidget {
  @override
  State<BodyEditProfile> createState() => _BodyEditProfileState();
}

class _BodyEditProfileState extends State<BodyEditProfile> {
  late UserData userD;
  DateTime tglUser = DateTime.now();
  late TextEditingController _dateController;
  late TextEditingController _heightController;
  late TextEditingController _weightController;
  String? img;
  late File? _image = null;

  @override
  void initState() {
    super.initState();
    final user = Provider.of<UserAccount>(context, listen: false);
    final userDataFuture = DatabaseService(email: user.email).uData.first;
    userDataFuture.then((value) {
      setState(() {
        userD = value;
        _dateController = TextEditingController(text: DateFormat('yyyy-MM-dd').format(userD.birthdate!));
        _heightController = TextEditingController(text: userD.height.toString());
        _weightController = TextEditingController(text: userD.weight.toString());
        img = userD.img;
      });
    });
  }

  void dispose() {
    _dateController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: userD.birthdate!,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != DateTime.now()) {
      setState(() {
        String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
        _dateController.text = formattedDate; // You can format the date as needed
      });
    }
  }

  // String? img;
  // late File? _image = null;
  final picker = ImagePicker();

  Future<void> _getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) _image = File(pickedFile.path); 
    });
  }

  Future<void> _getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) _image = File(pickedFile.path);
    });
  }

  Future<void> _removeImage() async {
    setState(() {
      _image = null; // Mengubah _image kembali ke gambar default
      img = defProf;
    });
  }

  Future uploadImg() async {
    try {
      // Path penyimpanan di Firebase Storage
      final path = 'userPic/${userD.name}Prof';

      // File yang akan diunggah
      final file = File(_image!.path);

      // Referensi ke path di Firebase Storage
      final ref = FirebaseStorage.instance.ref().child(path);

      // Melakukan proses upload dan menunggu hingga selesai
      final UploadTask uploadTask = ref.putFile(file);
      final TaskSnapshot snapshot = await uploadTask.whenComplete(() {});

      // Mendapatkan URL download setelah proses upload selesai
      img = await snapshot.ref.getDownloadURL();

      // Gunakan URL download sesuai kebutuhan Anda (misalnya, simpan di database, tampilkan di UI, dll.)
      print("URL Download: $img");
    } catch (e) {
      print("Error during image upload: $e");
    }
  }

  void _showProfileOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text('Ambil Foto dari Galeri'),
                  onTap: () {
                    _getImageFromGallery().then((_) {
                      Navigator.pop(context);
                    });
                  },
                ),
                ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text('Ambil Foto dari Kamera'),
                  onTap: () {
                    _getImageFromCamera().then((_) {
                      Navigator.pop(context);
                    });
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text('Hapus Foto'),
                  onTap: () {
                    _removeImage();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserAccount>(context);
    
    return StreamBuilder<UserData>(
        stream: DatabaseService(email: user.email).uData,
        builder: (context, snapshot) {
          UserData userD = snapshot.data!;
          return Padding(
            padding: EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      _showProfileOptions(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 11, 0, 54),
                      radius: 55,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: _image != null ? FileImage(_image!) : NetworkImage(img!) as ImageProvider<Object>,
                        radius: 50,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "${userD.name}",
                    style: TextStyle(
                      color: Color.fromARGB(255, 11, 0, 54),
                      fontFamily: "Ken",
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 35),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left:
                                  10), // Atur jarak kiri sebesar 8, sesuaikan sesuai kebutuhan
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Birth Date",
                              style: TextStyle(
                                color: Color.fromARGB(255, 11, 0, 54),
                                fontSize: 15,
                                fontFamily: "Ken",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10, top: 1),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 11, 0, 54)),
                              borderRadius: BorderRadius.circular(30.0)),
                          child: InkWell(
                            onTap: () {
                              _selectDate(context);
                            },
                            child: AbsorbPointer(
                              child: TextField(
                                controller: _dateController,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.calendar_today,
                                    color: Color.fromARGB(255, 11, 0, 54),
                                  ),
                                  hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 11, 0, 54)),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left:
                                  10), // Atur jarak kiri sebesar 8, sesuaikan sesuai kebutuhan
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Current Weight",
                              style: TextStyle(
                                color: Color.fromARGB(255, 11, 0, 54),
                                fontSize: 15,
                                fontFamily: "Ken",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 11, 0, 54)),
                              borderRadius: BorderRadius.circular(30.0)),
                          child: TextField(
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ], // Allow only digits
                            keyboardType: TextInputType.number,
                            controller:
                                _weightController, // Set the keyboard type to numeric
                            decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 11, 0, 54)),
                                border: InputBorder.none),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left:
                                  10), // Atur jarak kiri sebesar 8, sesuaikan sesuai kebutuhan
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Current Height",
                              style: TextStyle(
                                color: Color.fromARGB(255, 11, 0, 54),
                                fontSize: 15,
                                fontFamily: "Ken",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 11, 0, 54)),
                              borderRadius: BorderRadius.circular(30.0)),
                          child: TextField(
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ], // Allow only digits
                            keyboardType: TextInputType.number,
                            controller: _heightController,
                            decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 11, 0, 54)),
                                border: InputBorder.none),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          setState(() async{
                            // Validasi
                            if (_dateController.text.isEmpty ||
                                _heightController.text.isEmpty ||
                                _weightController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Please fill the form!'),
                                ),
                              );
                            } else {
                                try {
                                  await uploadImg();
                                  DatabaseService(email: user.email).updateUserData(
                                    userD.name!,
                                    userD.gender!,
                                    DateTime(
                                      int.parse(_dateController.text
                                          .substring(0, 4)),
                                      int.parse(_dateController.text
                                          .substring(5, 7)),
                                      int.parse(_dateController.text
                                          .substring(8)),
                                    ),
                                    double.parse(_heightController.text),
                                    double.parse(_weightController.text),
                                    BMI_Data(userD.height!, userD.weight!,
                                        userD.bmi!.UserTarget),
                                    img!);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Profile changed'),
                                  ),
                                );
                              } catch (e) {
                                // Handle the exception, e.g., show an error message
                                print("Error updating user data: $e");
                              }
                              print('SAVE DATA USER');
                            }
                          });
                        },
                        child: Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "Ken",
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 11, 0, 54)),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  EdgeInsets.symmetric(
                                      horizontal: 122, vertical: 15)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
