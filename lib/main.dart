import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/generated/l10n.dart';

import 'Core/cubit/Product Cubit/products_cubit.dart';
import 'Core/repo/productrepo.dart';
import 'Core/services/get_it.dart';
import 'Core/services/sharedprefrence.dart';
import 'Core/services/supabase_storage.dart';
import 'Core/utils/router/gorouter.dart';
import 'Core/cubit/Cart Cubit/cart_cubit.dart';
import 'package:fruitsapp/Core/cubit/ThemeCubit/theme_cubit.dart';

import 'Features/Favourite/data/repo/favourite_repo.dart';
import 'Features/Favourite/presentation/cubit/favourite_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalSharedprefrence.init();
  await SupabaseStorage.init();
  get_itsetup();

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const MainApp(),
    ),
  );
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
          BlocProvider(
            create: (context) => ThemeCubit(),
          ),
          BlocProvider(
            create: (context) => FavouriteCubit(get_it<FavouriteRepo>()),
          ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeData>(
          builder: (context, theme) {
            return MaterialApp.router(
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
              theme: theme,
              routerConfig: AppRouter.router,
            );
          },
        ),
      ),
    );
  }
}
