
import 'package:fruitsapp/Core/services/authentication_service.dart';
import 'package:fruitsapp/Core/services/favourite_service.dart';
import 'package:fruitsapp/Core/services/services.dart';
import 'package:fruitsapp/Core/services/storage_service.dart';
import 'package:fruitsapp/Core/services/supabase_service.dart';
import 'package:fruitsapp/Core/services/supabase_storage.dart';
import 'package:fruitsapp/Core/services/supabase_store_service.dart';
import 'package:fruitsapp/Features/Auth/Data/repo/authrepo.dart';
import 'package:fruitsapp/Features/Auth/Data/repo/authrepoimpl.dart';
import 'package:fruitsapp/Core/repo/productrepo.dart';
import 'package:fruitsapp/Core/repo/productrepoImpl.dart';
import 'package:fruitsapp/Features/Favourite/data/repo/favourite_repo.dart';
import 'package:get_it/get_it.dart';

import '../../Features/Favourite/data/repo/favourite_repo_impl.dart';
import 'supabase_favourite_service.dart';

final get_it = GetIt.instance;
get_itsetup() {
  get_it.registerSingleton<AuthenticationService>(SupabaseAuth());
  get_it.registerSingleton<Services>(SupabaseStoreService());
  get_it.registerSingleton<StorageService>(SupabaseStorage());
  get_it.registerSingleton<FavouriteService>(SupabaseFavouriteService());
  get_it.registerSingleton<Productrepo>(
      ProductrepoImp(storage: get_it<StorageService>()));
  get_it.registerSingleton<Authrepo>(
      AuthrepoImp(get_it<AuthenticationService>(), get_it<Services>()));
  get_it.registerSingleton<FavouriteRepo>(FavouriteRepoImpl(
     get_it<StorageService>() , get_it<FavouriteService>()));    
}
