import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/Features/Favourite/data/repo/favourite_repo.dart';
import 'package:fruitsapp/Core/cubit/Favourite%20cubit/favourite_cubit_states.dart';

import '../../model/productmodel.dart';

class FavouriteCubit extends Cubit<FavouriteCubitStates> {
  FavouriteCubit(this.favouriteRepo) : super(FavouriteInitialState()) {
    // Load favorites automatically when cubit is initialized
    getFavourites();
  }
  
  FavouriteRepo favouriteRepo;
  Set<int> favouriteProductIds = {};
  List<Productmodel> _cachedFavouriteProducts = [];


  void addToFavourites({required Productmodel product}) async {
        emit(FavouriteLoadingState());
        var response = await favouriteRepo.addToFavourites(product: product);
    response.fold((l) {
      emit(FavouriteErrorState(l));
    }, (r) {
      favouriteProductIds.add(product.id);
      _cachedFavouriteProducts.add(product);
      emit(FavouriteSuccessState(_cachedFavouriteProducts));
    });
      }

  void removeFromFavourites({required int productId}) async {
        emit(FavouriteLoadingState());
    
    var response = await favouriteRepo.removeFromFavourites(productId: productId);
    response.fold((l) {
      emit(FavouriteErrorState(l));
    }, (r) {
      favouriteProductIds.remove(productId);
      _cachedFavouriteProducts.removeWhere((element) => element.id == productId);
      emit(FavouriteSuccessState(_cachedFavouriteProducts));
    });
      }

  Future<void> getFavourites() async {

    emit(FavouriteLoadingState());
    
    var response = await favouriteRepo.getFavourites();
    response.fold((l) {
      emit(FavouriteErrorState(l));
    }, (r) {
      _cachedFavouriteProducts = r;
      favouriteProductIds = r.map((e) => e.id).toSet();
      emit(FavouriteSuccessState(r));
    });
      }

  bool isFavourite({required int productId}) {
    return favouriteProductIds.contains(productId);
  }
}
