import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruitsapp/Core/errors/Customexception.dart';
import 'package:fruitsapp/Core/model/productmodel.dart';
import 'package:fruitsapp/Core/services/favourite_service.dart';
import 'package:fruitsapp/Core/services/storage_service.dart';
import 'package:fruitsapp/backend_keys.dart';

import 'favourite_repo.dart';

class FavouriteRepoImpl implements FavouriteRepo {
  final FavouriteService favouriteService;
  final StorageService storageService ;
  FavouriteRepoImpl(this.storageService,  this.favouriteService);
 
  @override
  Future<Either<String,void>>addToFavourites({required Productmodel product}) async{
   try{
   await favouriteService.addToFavourites(itemId: product.id);
   return right(null);
   }on Customexception catch (e){
    log("Error in addToFavourites: ${e.message}");
   return left("حدث خطأ أثناء إضافة المنتج.");
   }
  }

  @override
  Future<Either<String,List<Productmodel>>> getFavourites()async {
    try {
      final response = await favouriteService.getFavourites().then((x){
        return x.map((e) => storageService.fetchProduct(collectionname: BackendKeys.productCollectionKey, productid: e)).toList();
      }); 
      List<Productmodel> products = [];
      if(response.isNotEmpty){ {
        for (var element in response) {
          var product = await element;
          if (product != null) {
            products.add(Productmodel.FromJson(product));
          }
        }
      }}
      return right(products);
    } on Customexception catch (e) {
      log("Error in getFavourites: ${e.message}");
     return left("حدث خطأ في تحميل المنتجات.");
    }
    
  }

  @override
  Future<Either<String,void>>removeFromFavourites({required int productId}) async{
    try {
      await favouriteService.removeFromFavourite(itemId: productId);
      return right(null);
    } on Customexception catch (e) {
      log("Error in removeFromFavourites: ${e.message}");
      return left("حدث خطأ أثناء حذف المنتج.");
    }
  }
  
  @override
  Future<bool> isFavourite({required int productId}) async{
    try {
     return await favouriteService.isFavourite(productid: productId);
    } on Customexception catch (e) {
      log("Error in isFavourite: ${e.message}");
      return false;
    }
  }

}