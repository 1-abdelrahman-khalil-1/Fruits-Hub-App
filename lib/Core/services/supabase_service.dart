import 'dart:developer';

import 'package:fruitsapp/Core/errors/Customexception.dart';
import 'package:fruitsapp/Core/services/authentication_service.dart';
import 'package:fruitsapp/Core/mock/mock_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuth implements AuthenticationService {
  @override
  Future<User> createUser(String emailAddress, String password) async {
    try {
      await Future.delayed(const Duration(milliseconds: 800));
      // Use emailAddress prefix as the mock name
      final name = emailAddress.split('@').first;
      final user = await MockDatabase.instance.signUp(name, emailAddress, password);
      return user;
    } on AuthException catch (e) {
      log("Error in SupabaseService createUser: ${e.message}");
      throw Customexception(message: e.message);
    } catch (e) {
      log("Error in SupabaseService createUser: $e");
      throw Customexception(message: 'حدث خطأ غير متوقع.');
    }
  }

  @override
  Future<User> signin(String emailAddress, String password) async {
    try {
      await Future.delayed(const Duration(milliseconds: 600));
      final user = await MockDatabase.instance.signIn(emailAddress, password);
      return user;
    } on AuthException catch (e) {
      log("Error in SupabaseService signin: ${e.message}");
      throw Customexception(message: e.message);
    } catch (e) {
      log("Error in SupabaseService signin: $e");
      throw Customexception(message: 'حدث خطأ غير متوقع.');
    }
  }

  @override
  Future<User?> signInWithGoogle() async {
    try {
      await Future.delayed(const Duration(milliseconds: 600));
      final user = await MockDatabase.instance.signInWithGoogle();
      return user;
    } catch (e) {
      log("Error in SupabaseService signInWithGoogle: $e");
      throw Customexception(message: 'حدث خطأ أثناء تسجيل الدخول بجوجل');
    }
  }

  @override
  Future<void> deleteuserData() async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));
      MockDatabase.instance.currentUser = null;
    } catch (e) {
      log("Error in SupabaseService deleteuserData: ${e.toString()}");
      throw Customexception(message: "يرجي المحاولة مرة أخرى.");
    }
  }

  @override
  bool isUserSignedIn() {
    return MockDatabase.instance.currentUser != null;
  }

  @override
  Future<void> signOut() async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));
      MockDatabase.instance.currentUser = null;
    } catch (e) {
      log("Error in SupabaseService signOut: ${e.toString()}");
      throw Customexception(message: "حدث خطأ أثناء تسجيل الخروج. يرجى المحاولة مرة أخرى.");
    }
  }
}


