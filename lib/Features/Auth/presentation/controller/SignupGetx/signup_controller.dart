import 'package:fruitsapp/Features/Auth/Data/model/user_model.dart';
import 'package:fruitsapp/Features/Auth/Data/repo/authrepo.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final Authrepo authrepoImp;
  
  SignupController(this.authrepoImp);

  var isLoading = false.obs;
  var message = ''.obs;
  var hasError = false.obs;
  Rx<UserModel?> user = Rx<UserModel?>(null);

  Future<void> signup(String name, String email, String password) async {
    isLoading.value = true;
    final result = await authrepoImp.signup(name, email, password);
    
    result.fold((error) {
      message.value = error;
      hasError.value = true;
      isLoading.value = false;
    }, (usermodel) {
      user.value = usermodel;
      message.value = "تم إنشاء حساب جديد بنجاح";
      hasError.value = false;
      isLoading.value = false;
    });
  }
}
