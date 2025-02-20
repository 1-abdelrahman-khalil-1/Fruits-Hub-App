import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/Core/helperFunctions/dialogloading.dart';
import 'package:fruitsapp/Core/helperFunctions/errorbar.dart';
import 'package:fruitsapp/Core/utils/router/gorouter.dart';
import 'package:fruitsapp/Features/Auth/presentation/Cubits/Logincubit/login_cubit.dart';
import 'package:fruitsapp/Features/Auth/presentation/Cubits/Logincubit/login_cubit_states.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/loginwidgets/loginbody.dart';
import 'package:go_router/go_router.dart';

class LoginBodyBLocConsumer extends StatelessWidget {
  const LoginBodyBLocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginCubitStates>(
      listener: (context, state) {
        if (state is LoginCubitLoading) {
          DialogLoading(context);
        } else {
          Navigator.pop(context);
        }
        if (state is LoginCubitFailure) {
          errorbar(context, error_message: state.message);
        } else if (state is LoginCubitSuccess) {
          errorbar(context, error_message: "تم تسجيل الدخول بنجاح");
          Future.delayed(const Duration(seconds: 1) , (){
           context.go(AppRouter.home);

          });
        }
      },
      builder: (context, state) {
        return const SafeArea(
          child: Scaffold(body: Loginbody()),
        );
      },
    );
  }
}
