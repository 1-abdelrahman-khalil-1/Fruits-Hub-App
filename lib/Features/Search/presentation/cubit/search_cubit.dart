import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/Core/repo/productrepo.dart';
import 'package:fruitsapp/backend_keys.dart';
import 'package:fruitsapp/Features/Search/presentation/cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final Productrepo _productrepo;
  
  SearchCubit(this._productrepo) : super(SearchInitial());
  
  Future<void> searchProducts({required String query}) async {
    if (query.isEmpty) {
      emit(SearchInitial());
      return;
    }
    
    emit(SearchLoading());
    

    final response = await _productrepo.searchProducts(
      collectionname: BackendKeys.productCollectionKey,
      query: query
    );
    
    response.fold(
      (error) => emit(SearchError(message: error)),
      (products) => emit(SearchSuccess(products, query))
    );
  }
  
  void clearSearch() {
    emit(SearchInitial());
  }
}