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
      log("Error in firebaseservice createUser: ${e.code}");
      if (e.code == 'weak-password' ) {
        throw Customexception(message:'🔑 كلمة المرور ضعيفة، يرجى اختيار كلمة أقوى.');
      } else if (e.code == 'email-already-in-use') {
        throw Customexception(message:'⚠️ البريد الإلكتروني مسجل بالفعل.');
      } else if (e.code == "invalid-email") {
        throw Customexception(message:'❌ البريد الإلكتروني غير صالح.');
      } else if (e.code == 'network-request-failed') {
        throw Customexception(message:'حدث خطا في الاتصال بالإنترنت.');
      } else {
        throw Customexception(message: '❌ حدث خطأ غير متوقع: ${e.code}');
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
       if (e.code == 'email-already-in-use') {
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
