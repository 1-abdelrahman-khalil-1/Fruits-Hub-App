
import 'package:fruitsapp/Features/Auth/Data/model/user_model.dart';

abstract class SignupCubitState {}

class SignupCubitInitial extends SignupCubitState {}
class SignupCubitLoading extends SignupCubitState {}
class SignupCubitSuccess extends SignupCubitState {
  final UserModel userModel;
  SignupCubitSuccess({required this.userModel});
}
class SignupCubitFailure extends SignupCubitState {
  final String message;
  SignupCubitFailure( {required this.message});
}
