import 'dart:developer';

import 'package:fruitsapp/Core/errors/Customexception.dart';
import 'package:fruitsapp/Core/services/authentication_service.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuth implements AuthenticationService {
  final SupabaseClient _supabaseClient = Supabase.instance.client;
  @override
  Future<User> createUser(String emailAddress, String password) async {
    try {
      final res = await _supabaseClient.auth.signUp(password: password, email: emailAddress);
      return res.user!;
    } on AuthException catch (e) {
      log("Error in SupabaseService createUser: ${e.code}");
       if (e.code!.contains('User already registered')) {
        throw Customexception(message:'البريد الإلكتروني مسجل بالفعل.');
      } else if (e.code!.contains('validation_failed')) {
        throw Customexception(message:'البريد الإلكتروني غير صالح.');
      } else if (e.code!.contains('Network error')) {
        throw Customexception(message:'حدث خطأ في الاتصال بالإنترنت.');
      } else {
        throw Customexception(message:'حدث خطأ غير متوقع: ${e.code}');
      }
    } 
  }
  @override
  Future<User> signin(String emailAddress, String password)async {
    try {
  final res = await _supabaseClient.auth.signInWithPassword(password: password, email: emailAddress);
  return res.user!;
} on AuthApiException catch (e) {
  log("Error in SupabaseService signin: ${e.message}");
    if (e.message.contains('Email not confirmed')) {
        throw  Customexception(message:'البريد الإلكتروني غير مؤكد. يرجى التحقق من بريدك الإلكتروني.');
      }else if (e.message.contains('Invalid login credentials')) {
        throw  Customexception(message:'البريد الإلكتروني أو كلمة المرور غير صحيحة.');
      } else if (e.message.contains('Network error')) {
        throw  Customexception(message:'حدث خطأ في الاتصال بالإنترنت.');
      } else {
        throw  Customexception(message:"حدث خطأ غير متوقع: ${e.message}");
      }
  }
}
  @override
  Future<User?> signInWithGoogle() async {
    /// Web Client ID that you registered with Google Cloud.
    const webClientId = '1070533804858-49de1t8ag9nppht699e700i72ohdof7f.apps.googleusercontent.com';

    /// iOS Client ID that you registered with Google Cloud.
    const clientId = '1070533804858-14r65b8h2d78d2rqae6nbrc2m02c6esk.apps.googleusercontent.com';

    try {
      // For iOS, we don't need to specify clientId when using URL schemes in Info.plist
      final GoogleSignIn googleSignIn = GoogleSignIn(
        // Only specify clientId for Android/Web
        // For iOS, the clientId is determined by the CFBundleURLSchemes in Info.plist
        serverClientId: webClientId,
        scopes: ['email', 'profile']
      );
      
      // User can cancel the sign-in process here
      final googleUser = await googleSignIn.signIn();
      
      // If googleUser is null, the user canceled the sign-in
      if (googleUser == null) {
        log("User canceled Google Sign-In");
        throw Customexception(message: 'تم إلغاء تسجيل الدخول بواسطة المستخدم');
      }
      
      final googleAuth = await googleUser.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;
      
      if (accessToken == null) {
        throw Customexception(message: 'No Access Token found.');
      }
      if (idToken == null) {
        throw Customexception(message: 'No ID Token found.');
      }
      
      final res = await _supabaseClient.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
      return res.user;
    } on Customexception {
      // Re-throw custom exceptions so they're handled properly
      rethrow;
    } on Exception catch (e) {
      log("Error in SupabaseService signInWithGoogle: ${e.toString()}");
      
      // Handle common Google Sign-In errors
      final errorMsg = e.toString().toLowerCase();
      if (errorMsg.contains('canceled') || errorMsg.contains('cancelled')) {
        throw Customexception(message: 'تم إلغاء تسجيل الدخول بواسطة المستخدم');
      } else if (errorMsg.contains('network')) {
        throw Customexception(message: 'حدث خطأ في الاتصال بالإنترنت');
      } else {
        throw Customexception(message: 'حدث خطأ أثناء تسجيل الدخول: ${e.toString()}');
      }
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
  }

  @override
  bool isUserSignedIn() {
   return _supabaseClient.auth.currentSession != null;
  }

  @override
  Future<void> signOut() async {
    try {
      await _supabaseClient.auth.signOut();
    } catch (e) {
      log("Error in SupabaseService signOut: ${e.toString()}");
      throw Customexception(message: "حدث خطأ أثناء تسجيل الخروج. يرجى المحاولة مرة أخرى.");
    }
  }
}

