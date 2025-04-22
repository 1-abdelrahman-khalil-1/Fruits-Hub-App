import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/Features/Favourite/data/repo/favourite_repo.dart';
import 'package:fruitsapp/Features/Favourite/presentation/cubit/favourite_cubit_states.dart';

import '../../../../Core/model/productmodel.dart';

class FavouriteCubit extends Cubit<FavouriteCubitStates> {
  FavouriteCubit(this.favouriteRepo) : super(FavouriteInitialState());
  FavouriteRepo favouriteRepo;
  Set<int> favouriteProducts = {};
  void addToFavourites({required Productmodel product}) async {
    emit(FavouriteLoadingState());
    var response = await favouriteRepo.addToFavourites(product: product);
    response.fold((l) {
      emit(FavouriteErrorState(l));
    }, (r) {
      favouriteProducts.add(product.id);
      emit(FavouriteSuccessState([]));
      emit(FavouriteIsFavouriteState(productId: product.id, isFavourite: true));
    });
  }

  void removeFromFavourites({required int productId}) async {
    emit(FavouriteLoadingState());
    var response =
        await favouriteRepo.removeFromFavourites(productId: productId);
    response.fold((l) {
      emit(FavouriteErrorState(l));
    }, (r) {
      favouriteProducts.remove(productId);
      emit(FavouriteSuccessState([]));
      emit(FavouriteIsFavouriteState(productId: productId, isFavourite: false));
    });
  }

  void getFavourites() async {
    emit(FavouriteLoadingState());
    var response = await favouriteRepo.getFavourites();
    response.fold((l) {
      emit(FavouriteErrorState(l));
    }, (r) {
      favouriteProducts = r.map((e) => e.id).toSet();
      emit(FavouriteSuccessState(r));
    });
  }

  bool isFavourite({required int productId}) {
    emit(FavouriteLoadingState());
    if (favouriteProducts.contains(productId)) {
      emit(FavouriteIsFavouriteState(productId: productId, isFavourite: true));
      return true;
    }
    emit(FavouriteIsFavouriteState(productId: productId, isFavourite: false));

    return false;
  }
}
