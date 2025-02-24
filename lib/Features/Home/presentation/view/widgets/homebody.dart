import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/services/firebaseservice.dart';
import 'package:fruitsapp/Core/services/get_it.dart';
import 'package:fruitsapp/Core/services/services.dart';
import 'package:fruitsapp/Core/services/sharedprefrence.dart';
import 'package:fruitsapp/Features/Auth/Data/model/user_model.dart';
import 'package:fruitsapp/Features/Auth/Data/repo/authrepo.dart';
import 'package:fruitsapp/Features/Auth/Data/repo/authrepoimpl.dart';
import 'package:fruitsapp/Features/Home/presentation/cubit/popular_products_cubit.dart';
import 'package:fruitsapp/Features/Home/presentation/view/widgets/custom_home_appbar.dart';
import 'package:fruitsapp/Features/Home/presentation/view/widgets/horizontallistview.dart';
import 'package:fruitsapp/Features/Home/presentation/view/widgets/popular_product_item.dart';
import 'package:fruitsapp/Features/Home/presentation/view/widgets/popularproductstitle.dart';
import 'package:fruitsapp/Features/Home/presentation/view/widgets/searchtextfield.dart';
import 'package:fruitsapp/Features/Home/presentation/view/widgets/slivergridblocbuilder.dart';

class Homebody extends StatelessWidget {
  const Homebody({super.key});

  @override
  Widget build(BuildContext context) {
       Authrepo loca = AuthrepoImp(get_it<FirebaseService>(), get_it<Services>()) ;
      UserModel user = loca.getCurrentUser(key: LocalSharedprefrence.userkey) ;
    return EasyRefresh(
      scrollController: ScrollController(keepScrollOffset: false) ,
      onRefresh: ()  {
         context.read<PopularProductsCubit>().fetchLowProductsPrice();
      },
      child:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   CustomHomeAppbar(title: user.name,),
                  SizedBox(height: 16.h),
                  const Searchtextfield(),
                  SizedBox(height: 10.h),
                  const HorizontalListView(),
                  SizedBox(height: 10.h),
                  const Popularproductstitle(showmore: true,),
                  
                ],
              ),
              
            ),
            const Slivergridblocbuilder(),
          ],
        ),
      ),
    );
  }
}
