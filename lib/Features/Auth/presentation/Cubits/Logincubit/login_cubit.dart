import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/Features/Auth/Data/repo/authrepo.dart';
import 'package:fruitsapp/Features/Auth/presentation/Cubits/Logincubit/login_cubit_states.dart';

class LoginCubit extends Cubit<LoginCubitStates> {
  LoginCubit(this.authrepoImp) : super(LoginCubitInitial());
  final Authrepo authrepoImp;
  login(String email, String password) async {
    emit(LoginCubitLoading());
    final user = await authrepoImp.login(email, password);
    user.fold((error) {
      emit(LoginCubitFailure(message: error));
    }, (usermodel) {
      emit(LoginCubitSuccess(usermodel,"تم تسجيل الدخول بنجاح"));
    });
  }
  signInWithGoogle()async{
    emit(LoginCubitLoading());
    final user = await authrepoImp.signInWithGoogle();
    user.fold((error) {
      emit(LoginCubitFailure(message: error));
    }, (usermodel) {
      emit(LoginCubitSuccess( usermodel,"تم تسجيل الدخول بنجاح"));
    });
  }
  
  sendVerificationCode({required String email})async{
    emit(LoginCubitLoading());
    final user = await authrepoImp.sendVerificationCode(email);
    user.fold((e){
      emit(LoginCubitFailure(message: e));
    }, (s){
      emit(LoginCubitSuccess(null, "تم إرسال الكود الي البريد الإلكتروني بنجاح"));
    });
  }
  verifyCode({required String email, required String enteredCode})async{
    emit(LoginCubitLoading());
    final user = await authrepoImp.verifyCode(email, enteredCode);
   if(user) {
    emit(LoginCubitSuccess(null, "تم التحقق من الكود بنجاح"));
   }else {
    emit(LoginCubitFailure(message: "الكود غير صحيح"));
   }
  }
}
