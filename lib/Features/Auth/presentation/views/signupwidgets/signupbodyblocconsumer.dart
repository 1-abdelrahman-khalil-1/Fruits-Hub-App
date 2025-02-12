import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/Core/helperFunctions/dialogloading.dart';
import 'package:fruitsapp/Core/helperFunctions/errorbar.dart';
import 'package:fruitsapp/Features/Auth/presentation/Cubits/Signupcubit/signup_cubit.dart';
import 'package:fruitsapp/Features/Auth/presentation/Cubits/Signupcubit/signup_cubit_state.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/signupwidgets/signupbody.dart';

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
          errorbar(context, error_message: state.message);
        } else if (state is SignupCubitSuccess) {
          errorbar(context, error_message: "تم إنشاء حساب جديد بنجاح");
        }
      },
      builder: (context, state) {
        return const Signupbody();
      },
    );
  }
}
