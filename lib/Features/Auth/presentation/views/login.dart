import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/Core/services/get_it.dart';
import 'package:fruitsapp/Features/Auth/Data/repo/authrepo.dart';
import 'package:fruitsapp/Features/Auth/presentation/Cubits/Logincubit/login_cubit.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/loginwidgets/loginbodyblocconsumer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(get_it.get<Authrepo>()),
      child: const LoginBodyBLocConsumer(),
    );
  }
}

