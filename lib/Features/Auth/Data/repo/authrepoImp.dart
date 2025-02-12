import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:fruitsapp/Core/errors/Customexception.dart';
import 'package:fruitsapp/Core/services/firebaseservice.dart';
import 'package:fruitsapp/Features/Auth/Data/model/user_model.dart';
import 'package:fruitsapp/Features/Auth/Data/repo/Authrepo.dart';

class AuthrepoImp implements Authrepo {
  FirebaseService auth ;
  AuthrepoImp(this.auth);
  @override
  Future<Either<String , UserModel>> login(String email, String password) async {
    try {
      final user = await auth.signin(email , password);
      final userModel = UserModel.fromFirebase(user);
      return Right(userModel);
    }on Customexception catch (e) {
      log("Error in AuthrepoImp login: ${e.message}");
      return Left( e.message);
    }
  }
  
  @override
  Future<Either<String, UserModel>> signup(String name, String email, String password) async{
    try {
      final user = await auth.createUser(email , password);
      final userModel = UserModel.fromFirebase(user);
      return Right(userModel);
    }on Customexception catch (e) {
      log("Error in AuthrepoImp signup: ${e.message}");
      return Left( e.message );
    }
  }
}