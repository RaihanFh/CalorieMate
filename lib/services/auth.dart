import 'package:firebase_auth/firebase_auth.dart';
import 'package:CalorieMate/Class/UserData.dart';
import 'package:CalorieMate/services/Database.dart';
import 'package:CalorieMate/Class/BMI_Data.dart';
import 'package:CalorieMate/services/varGlobal.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserAccount? _userFromFirebaseUser(User? user) {
    return user != null ? UserAccount(email: user.email) : null;
  }

  Stream<UserAccount?> get user {
    return _auth.authStateChanges().map(
      (user) => _userFromFirebaseUser(user));
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await DatabaseService(email: credential.user!.email).updateUserData('name', 'gender', DateTime(2002, 10, 28), 1, 0, BMI_Data(1, 0, 0),defProf);
      print("Data created successfully");
      return _userFromFirebaseUser(credential.user);
    } catch (e) {
      print("Error during signUp: ${e.toString()}");
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return _userFromFirebaseUser(credential.user);
    } catch (e) {
      print("Error during signIn: ${e.toString()}");
    }
  }

  Future changePassword(String email, String currentPassword, String newPassword) async {
   try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: currentPassword);

      await credential.user!.updatePassword(newPassword);
      return true; // Password changed successfully
    } catch (e) {
      print("Error during change password: ${e.toString()}");
      return false; // Failed to change password
    }
  }
}