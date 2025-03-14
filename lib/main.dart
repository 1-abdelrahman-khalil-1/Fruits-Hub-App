import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/generated/l10n.dart';

import 'Core/cubit/products_cubit.dart';
import 'Core/repo/productrepo.dart';
import 'Core/services/get_it.dart';
import 'Core/services/sharedprefrence.dart';
import 'Core/services/supabase_storage.dart';
import 'Core/utils/assets/appcolors.dart';
import 'Core/utils/router/gorouter.dart';
import 'Features/Cart/presentation/cubit/cart_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalSharedprefrence.init();
  await Firebase.initializeApp();
  await SupabaseStorage.init();
  get_itsetup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      ensureScreenSize: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductsCubit(get_it<Productrepo>()),
          ),
          BlocProvider(
            create: (context) => CartCubit(),
          ),
        ],
        child: MaterialApp.router(
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ar'),
          ],
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              fontFamily: "Cairo", scaffoldBackgroundColor: Appcolors.snow),
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
