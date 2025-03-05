import 'dart:developer';

import 'package:fruitsapp/Core/errors/Customexception.dart';
import 'package:fruitsapp/Core/services/authentication_service.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService implements AuthenticationService {
  final SupabaseClient _supabaseClient = Supabase.instance.client;
  @override
  Future<User> createUser(String emailAddress, String password) async {
    try {
      final res = await _supabaseClient.auth.signUp(password: password, email: emailAddress);
      return res.user!;
    } on AuthException catch (e) {
      log("Error in SupabaseService createUser: ${e.code}");
      if (e.code == 'weak-password') {
        throw Customexception(message: ' كلمة المرور ضعيفة، يرجى اختيار كلمة أقوى.');
      } else if (e.code == 'email-already-in-use') {
        throw Customexception(message: ' البريد الإلكتروني مسجل بالفعل.');
      } else if (e.code == "invalid-email") {
        throw Customexception(message: ' البريد الإلكتروني غير صالح.');
      } else if (e.code == 'network-request-failed') {
        throw Customexception(message: 'حدث خطا في الاتصال بالإنترنت.');
      } else {
        throw Customexception(message: ' حدث خطأ غير متوقع: ${e.code}');
      }
    } 
  }
  @override
  Future<User> signin(String emailAddress, String password)async {
    try {
  final res = await _supabaseClient.auth.signInWithPassword(password: password, email: emailAddress);
  return res.user!;
} on Customexception catch (e) {
  log("Error in SupabaseService signin: ${e.message}");
  if (e.message == 'network-request-failed') {
    throw Customexception(message: 'حدث خطا في الاتصال بالإنترنت.');
  } else if (e.message == 'invalid-credential') {
    throw Customexception(
        message: 'البريد الإلكتروني أو كلمة المرور غير صحيحة. يرجى المحاولة مرة أخرى.');
  } else if (e.message == "user-not-found") {
    throw Customexception(message: 'الحساب غير موجود.');
  } else {
    throw Customexception( message: ' حدث خطأ غير متوقع: ${e.message}');
}
  }
}
  @override
  Future<User?> signInWithGoogle()async {
    /// Web Client ID that you registered with Google Cloud.
  const webClientId = '1070533804858-49de1t8ag9nppht699e700i72ohdof7f.apps.googleusercontent.com';

  /// TODO: update the iOS client ID with your own.
  ///
  /// iOS Client ID that you registered with Google Cloud.
  const clientId = '1070533804858-14r65b8h2d78d2rqae6nbrc2m02c6esk.apps.googleusercontent.com';

  try {
  final GoogleSignIn googleSignIn = GoogleSignIn(
    clientId: clientId,
    serverClientId: webClientId
  );
  final googleUser = await googleSignIn.signIn();
  final googleAuth = await googleUser!.authentication;
  final accessToken = googleAuth.accessToken;
  final idToken = googleAuth.idToken;
  
  if (accessToken == null) {
    throw Customexception(message:  'No Access Token found.');
  }
  if (idToken == null) {
    throw Customexception(message:  'No ID Token found.');
  }
  
   final res =  await _supabaseClient.auth.signInWithIdToken(
    provider: OAuthProvider.google,
    idToken: idToken,
    accessToken: accessToken,
  );
    return res.user;
} on Exception catch (e) {
    log("Error in SupabaseService signInWithGoogle: ${e.toString()}");
    throw Customexception(message: 'حدث خطأ غير متوقع: ${e.toString()}');
}
  }

  @override
  Future<void> deleteuserData() async{
    try {
      await _supabaseClient.auth.signOut();
    } catch (e) {
      log("Error in SupabaseService deleteuserData: ${e.toString()}");
      throw Customexception(message: "يرجي المحاولة مرة أخرى.");
    }
    _supabaseClient.auth.verifyOTP(type: OtpType.sms);
  }

  @override
  bool isUserSignedIn() {
   return _supabaseClient.auth.currentUser != null;
  }




}