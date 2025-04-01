import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../Core/cubit/Product Cubit/products_cubit.dart';
import '../../../../../Core/utils/assets/apptextstyles.dart';
import './/Core/utils/router/gorouter.dart';
import './/Core/utils/widgets/customtextbutton.dart';
import './/Features/Category/presentation/view/widgets/choice.dart';
import 'package:go_router/go_router.dart';

class ChoicesOnBottomSheet extends StatefulWidget {
  const ChoicesOnBottomSheet({super.key});

  @override
  State<ChoicesOnBottomSheet> createState() => _ChoicesOnBottomSheetState();
}

class _ChoicesOnBottomSheetState extends State<ChoicesOnBottomSheet> {
  int? _selectedChoiceIndex;
 bool alpabatical = false , ascending =false;
  void _onChoiceSelected(int index) {
    setState(() {
      _selectedChoiceIndex = index;
      if(  _selectedChoiceIndex == 0) {
        alpabatical = false;
        ascending = true;
      } else if(_selectedChoiceIndex == 1) {
        alpabatical = false;
        ascending = false;
      } else if(_selectedChoiceIndex == 2) {
        alpabatical = true;
        ascending = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 60.w,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2,
                    strokeAlign: BorderSide.strokeAlignCenter,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15.h),
          Text(
            'ترتيب حسب :',
            style: AppTextStyles.bold19,
          ),
          Choice(
              text: "السعر ( الأقل الي الأعلي )",
              check: _selectedChoiceIndex == 0 ,
              onChanged: (value){
                if (value == true) _onChoiceSelected(0);
 
              },
              ),
          Choice(
              text: "السعر ( الأعلي الي الأقل )",
              check: _selectedChoiceIndex == 1, 
              onChanged: (value){
                if(value == true) _onChoiceSelected(1);

              },
              ),
              
          Choice(
            text: "الأبجديه",
            check: _selectedChoiceIndex == 2,
            onChanged: (value) {
              if (value == true) _onChoiceSelected(2);
            },
          ),
          CustomTextButton( text: "تصفيه" , onpressed: (){
            context.read<ProductsCubit>().priceFiltering(ascending: ascending , alpabatical: alpabatical);
           context.go(AppRouter.filtering_results);
            context.pop();
           
          } ,),
        ],
      ),
    );
  }
}
