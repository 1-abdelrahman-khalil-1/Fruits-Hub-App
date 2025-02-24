import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/Core/helperFunctions/dialogloading.dart';
import 'package:fruitsapp/Core/helperFunctions/errorbar.dart';
import 'package:fruitsapp/Core/utils/router/gorouter.dart';
import 'package:fruitsapp/Features/Auth/presentation/Cubits/Logincubit/login_cubit.dart';
import 'package:fruitsapp/Features/Auth/presentation/Cubits/Logincubit/login_cubit_states.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/loginwidgets/loginbody.dart';
import 'package:go_router/go_router.dart';

<<<<<<< HEAD
class LoginBodyBLocConsumer extends StatelessWidget {
=======
class LoginBodyBLocConsumer extends StatefulWidget {
>>>>>>> 5989eae (connect to supabase and fetch popular products from supabase database)
  const LoginBodyBLocConsumer({
    super.key,
  });

  @override
<<<<<<< HEAD
=======
  State<LoginBodyBLocConsumer> createState() => _LoginBodyBLocConsumerState();
}

class _LoginBodyBLocConsumerState extends State<LoginBodyBLocConsumer> {
  @override
>>>>>>> 5989eae (connect to supabase and fetch popular products from supabase database)
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

<<<<<<< HEAD
          });
        }
=======
          });  
        }
        setState(() {
          
        });
>>>>>>> 5989eae (connect to supabase and fetch popular products from supabase database)
      },
      builder: (context, state) {
        return const SafeArea(
          child: Scaffold(body: Loginbody()),
        );
      },
    );
  }
}
