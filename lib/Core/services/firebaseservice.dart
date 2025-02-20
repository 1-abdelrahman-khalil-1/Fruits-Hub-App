import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruitsapp/Core/errors/Customexception.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
        throw Customexception(message:' كلمة المرور ضعيفة، يرجى اختيار كلمة أقوى.');
      } else if (e.code == 'email-already-in-use') {
        throw Customexception(message:' البريد الإلكتروني مسجل بالفعل.');
      } else if (e.code == "invalid-email") {
        throw Customexception(message:' البريد الإلكتروني غير صالح.');
      } else if (e.code == 'network-request-failed') {
        throw Customexception(message:'حدث خطا في الاتصال بالإنترنت.');
      } else {
        throw Customexception(message: ' حدث خطأ غير متوقع: ${e.code}');
      }
    } catch (e) {
      throw Customexception(message:"يرجي المحاولة مرة أخرى.");
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
      log("Error in firebaseservice signin: ${e.code}");
       if (e.code == 'network-request-failed') {
        throw Customexception(message:'حدث خطا في الاتصال بالإنترنت.');
      }else if (e.code == 'invalid-credential') {
        throw Customexception(message:'البريد الإلكتروني أو كلمة المرور غير صحيحة. يرجى المحاولة مرة أخرى.');
      } else if (e.code == "user-not-found") {
        throw Customexception(message:'الحساب غير موجود.');
      } else {
        throw Customexception(message : 'حدث خطأ في تسجيل الدخول. يرجى المحاولة مرة أخرى.');
      }
    } catch (e) {
      log("Error in firebaseservice signinWithEmailAndPassword: ${e.toString()}");
      throw Customexception(message:"يرجي المحاولة مرة أخرى.");
    }
  }
 Future<User?> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  
  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken ,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return (await FirebaseAuth.instance.signInWithCredential(credential)).user;
}
Future<User?> signInWithFacebook() async {
  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login();

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

  // Once signed in, return the UserCredential
  return (await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential)).user;
}
Future<void>deleteuserData() async {
  await FirebaseAuth.instance.currentUser!.delete();
}

bool isUserSignedIn(){
  return FirebaseAuth.instance.currentUser != null ;
}

}