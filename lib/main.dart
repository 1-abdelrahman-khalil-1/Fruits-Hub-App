import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/services/get_it.dart';
import 'package:fruitsapp/Core/services/sharedprefrence.dart';
import 'package:fruitsapp/Core/services/supabase_storage.dart';
import 'package:fruitsapp/Core/utils/router/gorouter.dart';
import 'package:fruitsapp/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';

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
        theme: ThemeData(fontFamily: "Cairo"),
        routerConfig: AppRouter.router,
      ),
    );
  }
}