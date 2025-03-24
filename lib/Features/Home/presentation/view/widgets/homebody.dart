import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../Core/services/authentication_service.dart';
import '../../../../../../../Core/services/get_it.dart';
import '../../../../../../../Core/services/services.dart';
import '../../../../../../../Core/services/sharedprefrence.dart';
import '../../../../../Core/cubit/Product Cubit/products_cubit.dart';
import '../../../../Auth/Data/model/user_model.dart';
import '../../../../Auth/Data/repo/authrepo.dart';
import '../../../../Auth/Data/repo/authrepoimpl.dart';
import 'custom_home_appbar.dart';
import 'horizontallistview.dart';
import '../../../../../Core/utils/widgets/popularproductstitle.dart';
import '../../../../../Core/utils/widgets/searchtextfield.dart';
import '../../../../../../../Core/utils/widgets/slivergridblocbuilder.dart';
class Homebody extends StatefulWidget {
  const Homebody({super.key});

  @override
  State<Homebody> createState() => _HomebodyState();
}

class _HomebodyState extends State<Homebody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductsCubit>().fetchPopularProducts();
  }

  @override
  Widget build(BuildContext context) {
    Authrepo loca = AuthrepoImp(get_it<AuthenticationService>(), get_it<Services>());
    UserModel user = loca.getCurrentUser(key: LocalSharedprefrence.userkey);
    return EasyRefresh(
      onRefresh: () {
        context.read<ProductsCubit>().fetchPopularProducts();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomHomeAppbar(
                    title: user.name,
                  ),
                  SizedBox(height: 16.h),
                  const Searchtextfield(),
                  SizedBox(height: 10.h),
                  const HorizontalListView(),
                  SizedBox(height: 10.h),
                  const Popularproductstitle(
                    title: 'الأكثر مبيعًا',
                    showmore: true,
                  ),
                  SizedBox(height: 10.h),

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
