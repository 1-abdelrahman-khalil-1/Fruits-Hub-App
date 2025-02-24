import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/Core/errors/Customexception.dart';
import 'package:fruitsapp/Features/Home/Data/repo/productrepo.dart';
import 'package:fruitsapp/Features/Home/presentation/cubit/popular_products_cubit_states.dart';

class PopularProductsCubit extends Cubit<PopularProductsCubitStates> {
  PopularProductsCubit(this._productrepo) : super(InitialState());
   final Productrepo _productrepo;
  void fetchLowProductsPrice() async {
   emit(LoadingState());
    try {
      final response = await _productrepo.fetchProductData(collectionname: "Products Collection");
      response.fold((e){
        emit(ErrorState(message: e));
      }, (products){
        emit(SuccessState(products: products));
      });
    } on Customexception catch (e) {
      emit(ErrorState(message: e.message));
    } 
  }
  }