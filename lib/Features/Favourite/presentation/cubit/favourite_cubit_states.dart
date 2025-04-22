import 'package:fruitsapp/Core/model/productmodel.dart';

abstract class FavouriteCubitStates {}
class FavouriteInitialState extends FavouriteCubitStates {}
class FavouriteLoadingState extends FavouriteCubitStates {}
class FavouriteSuccessState extends FavouriteCubitStates {
  final List<Productmodel> favouriteProducts;
  FavouriteSuccessState(this.favouriteProducts);
}
class FavouriteErrorState extends FavouriteCubitStates {
  final String errorMessage;
  FavouriteErrorState(this.errorMessage);
}
class FavouriteIsFavouriteState extends FavouriteCubitStates {
  final bool isFavourite;
  final int productId;
 FavouriteIsFavouriteState({required this.isFavourite,required this.productId});
}