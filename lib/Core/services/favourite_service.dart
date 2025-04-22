
abstract class FavouriteService {
  Future<void> addToFavourites({required int itemId});
  Future<void> removeFromFavourite({required int itemId});
  Future<List<int>> getFavourites();
  Future<bool> isFavourite({ required int productid});
  
}

