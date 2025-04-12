import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/widgets/customtextfield.dart';
import 'package:fruitsapp/Features/Checkout%20Screen/data/model/order_model.dart';
import 'package:fruitsapp/Features/Checkout%20Screen/data/model/shipping_address_model.dart';

import '../../../../../Core/utils/widgets/customtextbutton.dart';
import 'appbar_name_checkout.dart';
import 'stepper_for_checkout.dart';

class AddressBody extends StatefulWidget {
  const AddressBody({super.key, required this.onPressed, required this.onbuttonpressed});
  final void Function() onPressed, onbuttonpressed ;

  @override
  State<AddressBody> createState() => _AddressBodyState();
}

class _AddressBodyState extends State<AddressBody> with AutomaticKeepAliveClientMixin {
      final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController apartmentNumberController =
      TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
 late ShippingAddressModel shippingAddressModel;
  @override
  void initState() {
    super.initState();
    shippingAddressModel = ShippingAddressModel(
      name: "",
      phone: "",
      address: "",
      city: "",
      apartmentNumber: "",
    );
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          AppbarNameCheckout(
            onPressed: (){
              widget.onPressed();
              FocusScope.of(context).unfocus();
            },
            title: "العنوان",
          ),
          SizedBox(height: 20.h),
          const StepperForCheckout(activeStepIndex: 1),
          SizedBox(height: 40.h),
          Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                CustomTextfield(
                  hinttext: "الاسم كامل",
                  icon: null,
                  textInputType: TextInputType.text,
                  onSaved: (value) {
                    shippingAddressModel.name = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "الرجاء إدخال الاسم كامل";
                    }
                    return null;
                  },
                  controller: fullNameController,
                ),
                SizedBox(height: 8.h),
                CustomTextfield(
                  hinttext: "العنوان",
                  icon: null,
                  textInputType: TextInputType.text,
                  onSaved: (value) {
                    shippingAddressModel.address = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "الرجاء إدخال العنوان";
                    }
                    return null;
                  },
                  controller: addressController,
                ),
                SizedBox(height: 8.h),
                CustomTextfield(
                  hinttext: "المدينه",
                  icon: null,
                  textInputType: TextInputType.text,
                  onSaved: (value) {
                    shippingAddressModel.city = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "الرجاء إدخال المدينه";
                    }
                    return null;
                  },
                  controller: cityController,
                ),
                SizedBox(height: 8.h),
                CustomTextfield(
                  hinttext: "الشقة",
                  icon: null,
                  textInputType: TextInputType.number,
                  onSaved: (value) {
                    shippingAddressModel.apartmentNumber = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "الرجاء إدخال رقم الطابق أو رقم الشقة";
                    }
                    return null;
                  },
                  controller: apartmentNumberController,
                ),
                SizedBox(height: 8.h),
                CustomTextfield(
                  hinttext: "رقم الهاتف",
                  icon: null,
                  textInputType: TextInputType.phone,
                  onSaved: (value) {
                    shippingAddressModel.phone = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "الرجاء إدخال رقم الهاتف";
                    }
                    return null;
                  },
                  controller: emailController,
                ),
              ],
            ),
          ),
          SizedBox(height: 90.h),
          CustomTextButton(
            text: "التالي",
            onpressed: () {
                widget.onbuttonpressed();
              _validation(context);
              FocusScope.of(context).unfocus();
            },
          ),
        ],
      ),
    );
  }

  void _validation(BuildContext context) {
     if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      context.read<OrderModel>().shippingAddress = shippingAddressModel;
                 
      widget.onbuttonpressed();
    }
    else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {
        
      });   
    }
  }
  
  @override
  bool get wantKeepAlive => true;
  @override
  void dispose(){
    fullNameController.dispose();
    emailController.dispose();
    addressController.dispose();
    cityController.dispose();
    apartmentNumberController.dispose();
    super.dispose();
  }
}