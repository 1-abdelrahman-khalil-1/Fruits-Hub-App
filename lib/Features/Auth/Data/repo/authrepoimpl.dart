import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:fruitsapp/Core/errors/Customexception.dart';
import 'package:fruitsapp/Core/services/authentication_service.dart';
import 'package:fruitsapp/Core/services/services.dart';
import 'package:fruitsapp/Core/services/sharedprefrence.dart';
import 'package:fruitsapp/Features/Auth/Data/model/user_model.dart';
import 'package:fruitsapp/Features/Auth/Data/repo/authrepo.dart';

class AuthrepoImp implements Authrepo {
  AuthenticationService auth;
  Services service;
  final String _collectionnamekey = "users";
  AuthrepoImp(this.auth, this.service);
  @override
  Future<Either<String, UserModel>> login(String email, String password) async {
    try {
      final user = await auth.signin(email, password);
      final userModel =
          await getUserData(collectionname: _collectionnamekey, uid: user.id);
      saveUserData(userModel: userModel);
      return Right(userModel);
    } on Customexception catch (e) {
      log("Error in AuthrepoImp login: ${e.message}");
      return Left(e.message);
    }
  }

  @override
  Future<Either<String, UserModel>> signup(
      String name, String email, String password) async {
    try {
      final user = await auth.createUser(email, password);
      var userModel =
          UserModel(name: name, email: user.email ?? "", uid: user.id);
      await adduserData(
          collectionname: _collectionnamekey,
          data: userModel.toMap(),
          uid: user.id);
      return Right(userModel);
    } on Customexception catch (e) {
      log("Error in AuthrepoImp signup: ${e.message}");
      deleteuserData();
      return Left(e.message);
    }
  }

  @override
  Future<Either<String, UserModel>> signInWithGoogle() async {
    try {
      final user = await auth.signInWithGoogle();
      if (user == null) {
        return const Left("الرجاء المحاولة مرة أخرى.");
      }
      final userModel = UserModel.fromFirebase(user);
      saveUserData(userModel: userModel);
      return Right(userModel);
    } on Customexception catch (e) {
      log("Error in AuthrepoImp signInWithGoogle: ${e.message}");
      return Left(e.message);
    }
  }

  

  @override
  Future<void> adduserData(
      {required String collectionname,
      required Map<String, dynamic> data,
      required String uid}) async {
    await service.adduserData(
        collectionname: collectionname, data: data, uid: uid);
  }

  @override
  Future<void> deleteuserData() async {
    await auth.deleteuserData();
  }

  @override
  bool isUserSignedIn() {
    return auth.isUserSignedIn();
  }

  @override
  Future<UserModel> getUserData(
      {required String collectionname, required String uid}) async {
    var user =
        await service.getUserData(collectionname: collectionname, uid: uid);
    return UserModel.FromJson(user);
  }

  @override
  Future<void> saveUserData({required UserModel userModel}) async {
    var user = jsonEncode(userModel.toMap());
    await LocalSharedprefrence.setstring(LocalSharedprefrence.userkey, user);
  }

  @override
  UserModel getCurrentUser({required String key}) {
    Map<String, dynamic> map = LocalSharedprefrence.getCurrentUserinMap(key);
    return UserModel.FromJson(map);
  }

  @override
  Future<Either<String, void>> sendVerificationCode(String email) async {
    try {
      await service.sendVerificationCode(email);
      return const Right(null);
    } on Customexception catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<bool> verifyCode(String email, String enteredCode) {
 
      return service.verifyCode(email, enteredCode);
    
  }
}
