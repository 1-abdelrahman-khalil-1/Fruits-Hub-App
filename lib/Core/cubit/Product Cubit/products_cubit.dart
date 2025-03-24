import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/Core/repo/productrepo.dart';
import 'package:fruitsapp/Core/cubit/Product%20Cubit/products_cubit_states.dart';

class ProductsCubit extends Cubit<ProductsCubitStates> {
  ProductsCubit(this._productrepo) : super(InitialState());
   final Productrepo _productrepo;
   fetchPopularProducts() async {
   emit(LoadingState());
      final response = await _productrepo.fetchProducts(collectionname: "Products Collection");
      response.fold((e){
        emit(ErrorState(message: e));
      }, (products){
        emit(SuccessState(products,products[0]));
      });
  }
   fetchProductData({required int productID}) async{
    emit(LoadingState());
      final response = await _productrepo.fetchProductData(collectionname: "Products Collection", productid: productID);
      response.fold((e){
        emit(ErrorState(message: e));
      }, (product){
        emit(SuccessState([],product));
      });
  }
  priceFiltering({required bool ascending, required bool alpabatical}) async{
    emit(LoadingState());
      final response = await _productrepo.priceFiltering(collectionname: "Products Collection", ascending: ascending, alpabatical: alpabatical);
      response.fold((e){
        emit(ErrorState(message: e));
      }, (products){
        emit(SuccessState(products,products[0]));
      });   
  }
  }