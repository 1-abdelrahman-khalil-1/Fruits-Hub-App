import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/Core/helperFunctions/dialogloading.dart';
import 'package:fruitsapp/Core/helperFunctions/bar.dart';
import 'package:fruitsapp/Core/utils/router/gorouter.dart';
import 'package:fruitsapp/Features/Auth/presentation/Cubits/Logincubit/login_cubit.dart';
import 'package:fruitsapp/Features/Auth/presentation/Cubits/Logincubit/login_cubit_states.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/loginwidgets/loginbody.dart';
import 'package:go_router/go_router.dart';

class LoginBodyBLocConsumer extends StatefulWidget {
  const LoginBodyBLocConsumer({
    super.key,
  });

  @override
  State<LoginBodyBLocConsumer> createState() => _LoginBodyBLocConsumerState();
}

class _LoginBodyBLocConsumerState extends State<LoginBodyBLocConsumer> {
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
          bar(context, message: state.message);
        } else if (state is LoginCubitSuccess) {
          bar(context, message: state.message);
          Future.delayed(const Duration(seconds: 1) , (){
           context.go(AppRouter.home);
          });  
        }
        setState(() {
          
        });
      },
      builder: (context, state) {
        return const SafeArea(
          child: Scaffold(body: Loginbody()),
        );
      },
    );
  }
}