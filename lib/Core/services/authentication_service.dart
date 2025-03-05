import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthenticationService {
  Future<User> createUser(String emailAddress, String password) ;

  Future<void> deleteuserData() ;

  bool isUserSignedIn() ;

  Future<User?> signInWithGoogle() ;

  Future<User> signin(String emailAddress, String password);

}
