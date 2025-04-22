import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/Core/repo/productrepo.dart';
import 'package:fruitsapp/Core/cubit/Product%20Cubit/products_cubit_states.dart';
import 'package:fruitsapp/backend_keys.dart';

class ProductsCubit extends Cubit<ProductsCubitStates> {
  ProductsCubit(this._productrepo) : super(InitialState());
   final Productrepo _productrepo;
  Future<void> fetchPopularProducts() async {
   emit(LoadingState());
      final response = await _productrepo.fetchProducts(collectionname: BackendKeys.productCollectionKey);
      response.fold((e){
        emit(ErrorState(message: e));
      }, (products){
        emit(SuccessState(products,products[0]));
      });
  }
  Future<void> fetchProductData({required int productID}) async{
    emit(LoadingState());
      final response = await _productrepo.fetchProductData(collectionname: BackendKeys.productCollectionKey, productid: productID);
      response.fold((e){
        emit(ErrorState(message: e));
      }, (product){
        emit(SuccessState([],product));
      });
  }
  priceFiltering({required bool ascending, required bool alpabatical}) async{
    emit(LoadingState());
      final response = await _productrepo.priceFiltering(collectionname: BackendKeys.productCollectionKey, ascending: ascending, alpabatical: alpabatical);
      response.fold((e){
        emit(ErrorState(message: e));
      }, (products){
        emit(SuccessState(products,products[0]));
      });   
  }
  }