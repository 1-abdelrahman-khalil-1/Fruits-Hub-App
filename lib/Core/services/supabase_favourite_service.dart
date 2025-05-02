import 'dart:developer';

import 'package:fruitsapp/backend_keys.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../errors/Customexception.dart';
import 'favourite_service.dart';

class SupabaseFavouriteService implements FavouriteService {
  final SupabaseClient supabaseClient = Supabase.instance.client;
  String? _userId;
  List<int>? _cachedFavorites;
  
  // Getter for userId that automatically initializes it if null
  String get userId {
    if (_userId == null) {
      userIdInit();
    }
    return _userId ?? '';
  }

  void userIdInit() {
    try {
      final currentUser = Supabase.instance.client.auth.currentUser;
      if (currentUser != null) {
        _userId = currentUser.id;
        log("User ID initialized: $_userId");
      } else {
        log("Warning: Current user is null, cannot initialize userId");
              }
    } catch (e) {
      log("Error initializing userId: $e");
    }
  }
  
  @override
  Future<void> addToFavourites({required int itemId}) async {
    if (userId.isEmpty) {
      throw Customexception(message: 'User not authenticated');
    }
    
    try {
      final List<int> favourites = await getFavourites();
      if (!favourites.contains(itemId)) { 
        final updatedFavorites = [...favourites, itemId];
        _cachedFavorites = updatedFavorites; // Update cache first for instant UI update
        
        await supabaseClient.from(BackendKeys.userCollectionKey).update({
          'favourite': updatedFavorites
        }).eq('id', userId);
      }
    } catch (e) {
      throw Customexception(message: 'Failed to add to favorites: $e');
    }
  }
  
  @override
  Future<List<int>> getFavourites() async {
    if (userId.isEmpty) {
      throw Customexception(message: 'User not authenticated');
    }
    
    try {
      // Return cached favorites if available to avoid duplicate network calls
      if (_cachedFavorites != null) {
        return _cachedFavorites!;
      }
      
      final response = await supabaseClient
          .from(BackendKeys.userCollectionKey)
          .select().eq("id", userId);
      _cachedFavorites = response[0]['favourite'] == null ? <int>[] : List<int>.from(response[0]['favourite']);
        return _cachedFavorites!;
          } catch (e) {
      log('Error fetching products in supabase: $e');
throw Customexception(message: 'حدث خطأ في التحميل المنتجات. ');
    }
  }
  
  @override
  Future<void> removeFromFavourite({required int itemId}) async {
    if (userId.isEmpty) {
      throw Customexception(message: 'User not authenticated');
    }

    try {
      final List<int> favourites = await getFavourites();
      if (favourites.contains(itemId)) {
        favourites.remove(itemId);
        _cachedFavorites = favourites; // Update cache first for instant UI update
        
        await supabaseClient.from(BackendKeys.userCollectionKey).update({
          'favourite': favourites
        }).eq('id', userId);
      }
    } catch (e) {
      throw Customexception(message: 'Failed to remove from favorites: $e');
    }
  }
  
  @override
  Future<bool> isFavourite({required int productid}) async {
    if (userId.isEmpty) {
      return false; // Not favorite if user isn't authenticated
    }
    
    try {
      final response = await getFavourites();
      return response.contains(productid);
    } catch (e) {
      log("Error checking favorite status: $e");
      return false;
    }
  }
  
  // Method to clear cache when needed (e.g., at logout)
  void clearCache() {
    _cachedFavorites = null;
  }
}

