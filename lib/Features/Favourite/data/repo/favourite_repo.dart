import 'package:dartz/dartz.dart';
import 'package:fruitsapp/Core/model/productmodel.dart';

abstract class FavouriteRepo {
  Future<Either<String,void>> addToFavourites({required Productmodel product});
  Future<Either<String,void>> removeFromFavourites({required int productId});
  Future<Either<String,List<Productmodel>>> getFavourites();
  Future<bool> isFavourite({required int productId});
}