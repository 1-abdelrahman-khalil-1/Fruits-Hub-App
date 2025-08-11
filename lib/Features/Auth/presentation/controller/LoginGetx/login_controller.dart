import 'package:fruitsapp/Features/Auth/Data/repo/authrepo.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final Authrepo authrepoImp;
  LoginController(this.authrepoImp);

  var isLoading = false.obs;
  var message = ''.obs;
  var hasError = false.obs;

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    final user = await authrepoImp.login(email, password);
    user.fold((error) {
      message.value = error;
      hasError.value = true;
      isLoading.value = false;
    }, (usermodel) {
      message.value = "تم تسجيل الدخول بنجاح";
      hasError.value = false;
      isLoading.value = false;
    });
  }

  Future<void> signInWithGoogle() async {
    isLoading.value = true;
    final user = await authrepoImp.signInWithGoogle();
    user.fold((error) {
      message.value = error;
      hasError.value = true;
      isLoading.value = false;
    }, (usermodel) {
      message.value = "تم تسجيل الدخول بنجاح";
      hasError.value = false;
      isLoading.value = false;
    });
  }
}