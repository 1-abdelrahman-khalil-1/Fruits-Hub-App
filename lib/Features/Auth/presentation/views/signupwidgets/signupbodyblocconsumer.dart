import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/Core/helperFunctions/dialogloading.dart';
import 'package:fruitsapp/Core/helperFunctions/bar.dart';
import 'package:fruitsapp/Features/Auth/presentation/Cubits/Signupcubit/signup_cubit.dart';
import 'package:fruitsapp/Features/Auth/presentation/Cubits/Signupcubit/signup_cubit_state.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/signupwidgets/signupbody.dart';
import 'package:go_router/go_router.dart';

class SignupBodyBlocConsumer extends StatelessWidget {
  const SignupBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupCubitState>(
      listener: (context, state) {
        if (state is SignupCubitLoading) {
          DialogLoading(context);
        } else {
          Navigator.pop(context); //to exit the loading dialog
        }
        if (state is SignupCubitFailure) {
          bar(context, message: state.message);
        } else if (state is SignupCubitSuccess) {
          bar(context, message: "تم إنشاء حساب جديد بنجاح");
           Future.delayed(const Duration(seconds: 1) , (){
           context.pop();

          });
        }
      },
      builder: (context, state) {
        return const Signupbody();
      },
    );
  }
}
