import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/Features/Auth/Data/repo/AuthrepoImp.dart';
import 'package:fruitsapp/Features/Auth/presentation/Cubits/Logincubit/login_cubit_states.dart';

class LoginCubit extends Cubit<LoginCubitStates> {
  LoginCubit(this.authrepoImp) : super(LoginCubitInitial());
  final AuthrepoImp authrepoImp;
  login(String email, String password) async {
    emit(LoginCubitLoading());
    final user = await authrepoImp.login(email, password);
    user.fold((error) {
      emit(LoginCubitFailure(message: error));
    }, (usermodel) {
      emit(LoginCubitSuccess(userModel: usermodel));
    });
  }
}
