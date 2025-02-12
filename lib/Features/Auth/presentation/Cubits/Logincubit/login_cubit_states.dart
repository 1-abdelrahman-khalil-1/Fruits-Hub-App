import 'package:fruitsapp/Features/Auth/Data/model/user_model.dart';

abstract class LoginCubitStates {}
class LoginCubitInitial extends LoginCubitStates {}
class LoginCubitLoading extends LoginCubitStates {}
class LoginCubitSuccess extends LoginCubitStates {
  final UserModel userModel;
  LoginCubitSuccess({required this.userModel});
}
class LoginCubitFailure extends LoginCubitStates {
  final String message;
  LoginCubitFailure( {required this.message});
}
