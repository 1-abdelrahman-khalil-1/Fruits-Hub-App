import '../../../Data/model/user_model.dart';

abstract class LoginCubitStates {}
class LoginCubitInitial extends LoginCubitStates {}
class LoginCubitLoading extends LoginCubitStates {}
class LoginCubitSuccess extends LoginCubitStates {
  final UserModel ?userModel;
  final String message;
  LoginCubitSuccess(this.userModel, this.message);
}
class LoginCubitFailure extends LoginCubitStates {
  final String message;
  LoginCubitFailure( {required this.message});
}
