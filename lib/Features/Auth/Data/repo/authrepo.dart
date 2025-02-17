import 'package:dartz/dartz.dart';
import 'package:fruitsapp/Features/Auth/Data/model/user_model.dart';

abstract class Authrepo {
   Future<Either<String , UserModel>> login(String email, String password);
   Future<Either<String , UserModel>> signup(String name, String email, String password);
   Future<Either<String , UserModel>> signInWithGoogle();
   Future<Either<String , UserModel>> signInWithFacebook();
}