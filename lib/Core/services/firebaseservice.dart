import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruitsapp/Core/errors/Customexception.dart';

class FirebaseService {
  Future<User> createUser(String emailAddress, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Error in firebaseservice createUser: ${e.message}");
      if (e.code == 'weak-password') {
        throw 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        throw 'The account already exists for that email.';
      } else if (e.code == "operation-not-allowed") {
        throw 'Email/password accounts are not enabled.';
      } else if (e.code == 'network-request-failed') {
        throw 'There was a network request error.';
      } else {
        throw ('An unknown error occurred.');
      }
    } catch (e) {
      throw ("An error occurred please try again later.");
    }
  }

  Future<User> signin(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Error in firebaseservice signin: ${e.message}");
      if (e.code == 'weak-password') {
        throw  Customexception(message:'كلمة السر غير قوية.');
      } else if (e.code == 'email-already-in-use') {
        throw Customexception(message:'الحساب مسجل بالفعل لهذا البريد الإلكتروني.');
      } else if (e.code == "user-not-found") {
        throw Customexception(message:'الحساب غير موجود.');
      } else if (e.code == 'network-request-failed') {
        throw Customexception(message:'حدث خطا في الاتصال بالإنترنت.');
      } else {
        throw Customexception(message : 'حدث خطأ في تسجيل الدخول. يرجى المحاولة مرة أخرى.');
      }
    } catch (e) {
      log("Error in firebaseservice signinWithEmailAndPassword: ${e.toString()}");
      throw Customexception(message:"يرجي المحاولة مرة أخرى.");
    }
  }
}
