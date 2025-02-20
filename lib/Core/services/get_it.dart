import 'package:fruitsapp/Core/services/firebaseservice.dart';
import 'package:fruitsapp/Core/services/firestore_services.dart';
import 'package:fruitsapp/Core/services/services.dart';
import 'package:fruitsapp/Features/Auth/Data/repo/authrepo.dart';
import 'package:fruitsapp/Features/Auth/Data/repo/authrepoimpl.dart';
import 'package:get_it/get_it.dart';
 final get_it = GetIt.instance;
get_itsetup(){
  get_it.registerSingleton<FirebaseService>(FirebaseService());
  get_it.registerSingleton<Services>(FirestoreService());
  get_it.registerSingleton<Authrepo>(AuthrepoImp(get_it<FirebaseService>(), get_it<Services>()));
}