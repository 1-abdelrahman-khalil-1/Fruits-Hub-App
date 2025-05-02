import 'package:dartz/dartz.dart';
import 'package:fruitsapp/Features/Auth/Data/model/user_model.dart';

abstract class Authrepo {
   Future<Either<String , UserModel>> login(String email, String password);
   Future<Either<String , UserModel>> signup(String name, String email, String password);
   Future<Either<String , UserModel>> signInWithGoogle();
   Future<void> adduserData({required String collectionname, required Map<String, dynamic> data });
   Future<void> deleteuserData();
   bool isUserSignedIn();
   Future<UserModel> getUserData({required String collectionname,required String uid});
   Future<void> saveUserData({required UserModel userModel});
   UserModel getCurrentUser({required String key});
   Future<void> updateUserData({required String collectionname, required String uid, required Map<String, dynamic> data});
   Future<Either<String, bool>> logout();
  }