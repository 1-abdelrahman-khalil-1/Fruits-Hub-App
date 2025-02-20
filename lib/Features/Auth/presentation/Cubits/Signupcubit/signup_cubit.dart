import 'package:fruitsapp/Features/Auth/Data/repo/authrepo.dart';
import 'package:fruitsapp/Features/Auth/presentation/Cubits/Signupcubit/signup_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SignupCubit extends Cubit<SignupCubitState> {
  SignupCubit(this.authrepoImp) : super(SignupCubitInitial());
  final Authrepo authrepoImp;

  signup(String name, String email, String password) async {
    emit(SignupCubitLoading());
    final user = await authrepoImp.signup(name, email, password);
    user.fold((error) {
      emit(SignupCubitFailure(message: error));
    }, (usermodel) {
      emit(SignupCubitSuccess(userModel: usermodel));
    });
  }
}
