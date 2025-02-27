import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String name, email, uid;

  UserModel({required this.name, required this.email, required this.uid});

  factory UserModel.fromFirebase(User user ) {
    return UserModel(
        name: user.displayName ?? ' ', email: user.email ?? ' ', uid: user.uid);
  }
  factory UserModel.FromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'] ?? ' ', email: json['email'] ?? ' ', uid: json['id']);
  }
  toMap(){
    return {
      'name': name,
      'email': email,
      'id': uid,
    };
  }
}
