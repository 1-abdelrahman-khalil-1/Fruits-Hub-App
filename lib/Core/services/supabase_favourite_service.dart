import 'dart:developer';

import 'package:fruitsapp/backend_keys.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../errors/Customexception.dart';
import 'favourite_service.dart';

class SupabaseFavouriteService implements FavouriteService {
  final SupabaseClient supabaseClient = Supabase.instance.client; 
  final userId = Supabase.instance.client.auth.currentUser!.id;
  @override
  Future<void> addToFavourites( {required int itemId}) async {
   
     try {
      final List<int> favourites = await getFavourites();
      if (!favourites.contains(itemId)) { 
        await supabaseClient.from(BackendKeys.userCollectionKey).update({
          'favourite': [...favourites, itemId]
        }).eq('id', userId);
      }
    } catch (e) {
      throw Customexception(message: 'Failed to add to favorites: $e');
    }
  }
  
  @override
  Future<List<int>> getFavourites()async {
   try {
      final response = await supabaseClient
          .from(BackendKeys.userCollectionKey)
          .select().eq("id", userId);
      return response[0]['favourite'] == null ? [] : List<int>.from(response[0]['favourite']);
    } catch (e) {
      log('Error fetching products in supabase: $e');
      throw Customexception(message: 'حدث خطأ في التحميل المنتجات. ');
    }
  }
  
  @override
  Future<void> removeFromFavourite( {required int itemId}) async {

    try {
  final List<int> favourites = await getFavourites();
  if(favourites.contains(itemId)) {
    // إذا كان المنتج موجودًا في المفضلات، قم بإزالته
    favourites.remove(itemId);
    await supabaseClient.from(BackendKeys.userCollectionKey).update({
      'favourite': favourites
    }).eq('id', userId);
  }
} catch (e) {
  throw Customexception(message: 'Failed to remove from favorites: $e');
}
  }
  @override
  Future<bool> isFavourite({required int productid}) async 
 {   
    try {
      final response = await getFavourites();
    log("response: ${response.contains(productid)}");
   return response.contains(productid) ? true : false;
    } catch (e) {
      throw Exception('Failed to check favorite status: $e');
    }
  }
}

