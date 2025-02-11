import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String name, email, id;

  UserModel({required this.name, required this.email, required this.id});

  factory UserModel.fromFirebase(User user) {
    return UserModel(
        name: user.displayName ?? ' ', email: user.email ?? ' ', id: user.uid);
  }

  topMap(){
    return {
      'name': name,
      'email': email,
      'id': id,
    };
  }
}
