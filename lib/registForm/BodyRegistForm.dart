import 'package:CalorieMate/BMIDetails/BMIDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:CalorieMate/Class/UserData.dart';
import 'package:provider/provider.dart';
import 'package:CalorieMate/services/Database.dart';
import 'package:CalorieMate/Class/BMI_Data.dart';
import 'package:CalorieMate/services/varGlobal.dart' as global;

class BodyRegistForm extends StatefulWidget {
  @override
  State<BodyRegistForm> createState() => _BodyRegistFormState();
}

class _BodyRegistFormState extends State<BodyRegistForm> {
  String gender = '';
  TextEditingController _nameController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  
  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != DateTime.now()) {
      setState(() {
        String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
        _dateController.text = formattedDate;
      });
    }
  }

  @override
    void dispose() {
      _dateController.dispose();
      _heightController.dispose();
      _weightController.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
  final user = Provider.of<UserAccount>(context);
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
                    padding: EdgeInsets.only(left: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "What's your gender?",
                        style: TextStyle(
                          color: Color.fromARGB(255, 11, 0, 54),
                          fontSize: 15,
                          fontFamily: "Ken",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.zero,
                    child: Row(
                      children: <Widget>[
                        Radio(
                          activeColor: Color.fromARGB(255, 11, 0, 54),
                          value: 'Male',
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          },
                        ),
                        Text(
                          'Male',
                          style: TextStyle(
                            color: Color.fromARGB(255, 11, 0, 54),
                            fontSize: 15,
                            fontFamily: "Ken",
                          ),  
                        ),
                        Radio(
                          activeColor: Color.fromARGB(255, 11, 0, 54),
                          value: 'Female',
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          },
                        ),
                        Text(
                          'Female',
                          style: TextStyle(
                            color: Color.fromARGB(255, 11, 0, 54),
                            fontSize: 15,
                            fontFamily: "Ken",
                          ),  
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "When were you born?",
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
                    padding: EdgeInsets.only(left: 10, right: 10, top: 1),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 11, 0, 54)),
                      borderRadius: BorderRadius.circular(30.0)
                    ),
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
                            hintStyle: TextStyle(color: Color.fromARGB(255, 11, 0, 54)),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "What's your name",
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
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Color.fromARGB(255, 11, 0, 54)),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "What's your height?",
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
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number, 
                      controller: _heightController,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Color.fromARGB(255, 11, 0, 54)),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "What's your weight?",
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
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number, 
                      controller: _weightController,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Color.fromARGB(255, 11, 0, 54)),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: TextButton(
                  onPressed: () async {
                    if (gender.isEmpty ||
                        _dateController.text.isEmpty ||
                        _heightController.text.isEmpty ||
                        _weightController.text.isEmpty ||
                        _nameController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please fill the form!'),
                        ),
                      );
                    } else {
                      global.globalIsLogin = false;
                      try {
                        await DatabaseService(email: user.email).updateUserData(
                          _nameController.text,
                          gender,
                          DateTime(
                            int.parse(_dateController.text.substring(0, 4)),
                            int.parse(_dateController.text.substring(5, 7)),
                            int.parse(_dateController.text.substring(8)),
                          ),
                          double.parse(_heightController.text),
                          double.parse(_weightController.text),
                          BMI_Data(double.parse(_heightController.text), double.parse(_weightController.text), 0),
                          "https://firebasestorage.googleapis.com/v0/b/caloriemate-a83c3.appspot.com/o/userPic%2FDEFAULT_PROFILE_PIC.png?alt=media&token=8ff196d2-32b8-4496-90bf-aba8a0bfcbc1"
                        );
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration.zero,
                            pageBuilder: (_, __, ___) => BMIDetailPage(),
                          ),
                        );
                      } catch (e) {
                        // Handle the exception, e.g., show an error message
                        print("Error updating user data: $e");
                      }
                    }
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: "Ken",
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 11, 0, 54)),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(horizontal: 112, vertical: 15)),
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
          ],
        ),
      ),
    );
  }
}
