import 'package:fruitsapp/Core/services/firebaseservice.dart';
import 'package:fruitsapp/Features/Auth/Data/repo/authrepoimpl.dart';
import 'package:get_it/get_it.dart';
 final get_it = GetIt.instance;
get_itsetup(){
  get_it.registerSingleton<FirebaseService>(FirebaseService());

  get_it.registerSingleton<AuthrepoImp>(AuthrepoImp(get_it<FirebaseService>()));
}