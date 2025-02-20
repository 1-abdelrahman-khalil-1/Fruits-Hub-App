
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/Core/services/get_it.dart';
import 'package:fruitsapp/Features/Auth/Data/repo/authrepo.dart';
import 'package:fruitsapp/Features/Auth/presentation/Cubits/Signupcubit/signup_cubit.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/signupwidgets/signupbodyblocconsumer.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocProvider(
        create: (context) => SignupCubit(get_it.get<Authrepo>()),
        child: const SignupBodyBlocConsumer(),
      ),
    ));
  }
}


