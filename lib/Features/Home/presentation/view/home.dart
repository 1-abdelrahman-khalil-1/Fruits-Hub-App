import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:fruitsapp/Core/utils/widgets/mybottom_navigation_bar.dart';
import 'package:fruitsapp/Features/Home/presentation/view/widgets/homebody.dart';
=======
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/Core/services/get_it.dart';
import 'package:fruitsapp/Features/Home/Data/repo/productrepo.dart';
import 'package:fruitsapp/Features/Home/presentation/cubit/popular_products_cubit.dart';
import 'package:fruitsapp/Features/Home/presentation/view/widgets/home_body_bloc_consumer.dart';
>>>>>>> 5989eae (connect to supabase and fetch popular products from supabase database)

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return const SafeArea(
        child: Scaffold(
      bottomNavigationBar: MybottomNavigationBar(selectedindex: 0),
      body: Homebody(),
    ));
  }
}


=======
    return BlocProvider(
      create: (context) => PopularProductsCubit(get_it<Productrepo>()),
      child: const HomeBodyBlocConsumer(),
    );
  }
}
>>>>>>> 5989eae (connect to supabase and fetch popular products from supabase database)
