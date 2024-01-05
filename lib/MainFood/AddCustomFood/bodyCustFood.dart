import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:CalorieMate/Class/UserData.dart';
import 'package:CalorieMate/services/FoodDatabase.dart';
import 'package:CalorieMate/MainFood/MainFoodPage.dart';


class bodyCustFood extends StatefulWidget {
  @override
  State<bodyCustFood> createState() => _bodyCustFoodState();
}

class _bodyCustFoodState extends State<bodyCustFood> {
  TextEditingController _fNameController = TextEditingController();
  TextEditingController _fWeightController = TextEditingController();
  TextEditingController _fCalorieController = TextEditingController();
  TextEditingController _fFatController = TextEditingController();
  TextEditingController _fProteinController = TextEditingController();
  TextEditingController _fCarbController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserAccount>(context);
    
    return Padding(
      padding: EdgeInsets.only(right: 30, left: 30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left:10), // Atur jarak kiri sebesar 8, sesuaikan sesuai kebutuhan
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Name",
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
                      controller: _fNameController,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Color.fromARGB(255, 11, 0, 54)),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.only(left:10), // Atur jarak kiri sebesar 8, sesuaikan sesuai kebutuhan
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Weight",
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
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Allow only digits
                      keyboardType: TextInputType.number, // Set the keyboard type to numeric
                      controller: _fWeightController,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Color.fromARGB(255, 11, 0, 54)),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.only(left: 10), // Atur jarak kiri sebesar 8, sesuaikan sesuai kebutuhan
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Calorie",
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
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Allow only digits
                      keyboardType: TextInputType.number, // Set the keyboard type to numeric
                      controller: _fCalorieController,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Color.fromARGB(255, 11, 0, 54)),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.only(left: 10), // Atur jarak kiri sebesar 8, sesuaikan sesuai kebutuhan
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Fat",
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
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Allow only digits
                      keyboardType: TextInputType.number, // Set the keyboard type to numeric
                      controller: _fFatController,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Color.fromARGB(255, 11, 0, 54)),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.only(left: 10), // Atur jarak kiri sebesar 8, sesuaikan sesuai kebutuhan
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Protein",
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
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Allow only digits
                      keyboardType: TextInputType.number, // Set the keyboard type to numeric
                      controller: _fProteinController,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Color.fromARGB(255, 11, 0, 54)),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.only(left: 10), // Atur jarak kiri sebesar 8, sesuaikan sesuai kebutuhan
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Carb",
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
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Allow only digits
                      keyboardType: TextInputType.number, // Set the keyboard type to numeric
                      controller: _fCarbController,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Color.fromARGB(255, 11, 0, 54)),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(height: 20,),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 10),
                  //   child: Align(
                  //     alignment: Alignment.topLeft,
                  //     child: Text(
                  //       'Ingredients (Optional)',
                  //       style: TextStyle(
                  //         color: Color.fromARGB(255, 11, 0, 54),
                  //         fontSize: 15,
                  //         fontFamily: "Ken",
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 15,),
                  // Container(
                  //   padding: EdgeInsets.only(left: 10, right: 10),
                  //   decoration: BoxDecoration(
                  //     border: Border.all(color: Color.fromARGB(255, 11, 0, 54)),
                  //     borderRadius: BorderRadius.circular(30.0)
                  //   ),
                  //   child: TextField(
                  //     minLines: 5,
                  //     maxLines: 15,
                  //     keyboardType: TextInputType.multiline,
                  //     controller: _fIngredientController,
                  //     decoration: InputDecoration(
                  //       hintStyle: TextStyle(color: Color.fromARGB(255, 11, 0, 54)),
                  //       border: InputBorder.none,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 20,)
                ],
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    setState(() async{
                      // Validasi gender
                      if (_fCalorieController.text.isEmpty || _fCarbController.text.isEmpty || _fFatController.text.isEmpty || _fNameController.text.isEmpty || _fProteinController.text.isEmpty || _fWeightController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please fill the form!'),
                          ),
                        );
                      }else{
                        try {
                          await FoodDatabase().uploadConsumables(
                            user.email!,
                            _fNameController.text,
                            int.parse(_fCalorieController.text),
                            int.parse(_fFatController.text),
                            int.parse(_fProteinController.text),
                            int.parse(_fCarbController.text),
                            int.parse(_fWeightController.text)
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Successfully added custom food'),
                            ),
                          );
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: Duration.zero,
                              pageBuilder: (_, __, ___) => MainFoodPage(),
                            ),
                          );
                        } catch (e) {
                          // Handle the exception, e.g., show an error message
                          print("Error uploading intake: $e");
                        }
                      }
                    });
                  },
                  child: Text(
                    'Submit',
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
                        EdgeInsets.symmetric(horizontal: 115, vertical: 15)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
