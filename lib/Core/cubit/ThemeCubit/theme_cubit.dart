import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme);
  static Color whitecolor = Colors.white;
  static Color darkColors = const Color(0x000d0d0d);
  static final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: "Cairo",
    scaffoldBackgroundColor: whitecolor,
  );
  static final ThemeData _darkTheme = ThemeData(
   // brightness: Brightness.dark,
    fontFamily: "Cairo",
    scaffoldBackgroundColor: darkColors,
  );

  void toggleTheme(bool isDarkMode) {
    emit(isDarkMode ? _darkTheme : _lightTheme);
  }
}
