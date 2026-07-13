import 'dart:developer';

import 'package:fruitsapp/Core/mock/mock_data.dart';
import 'favourite_service.dart';

class SupabaseFavouriteService implements FavouriteService {
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
      final currentUser = MockDatabase.instance.currentUser;
      if (currentUser != null) {
        _userId = currentUser['id'];
        log("Mock User ID initialized: $_userId");
      } else {
        log("Warning: Current mock user is null, cannot initialize userId");
      }
    } catch (e) {
      log("Error initializing userId: $e");
    }
  }
  
  @override
  Future<void> addToFavourites({required int itemId}) async {
    try {
      await Future.delayed(const Duration(milliseconds: 400));
      final currentUser = MockDatabase.instance.currentUser;
      if (currentUser == null) {
        throw Exception('User not authenticated');
      }
      final List<int> favourites = await getFavourites();
      if (!favourites.contains(itemId)) { 
        final updatedFavorites = [...favourites, itemId];
        _cachedFavorites = updatedFavorites; // Update cache first for instant UI update
        currentUser['favourite'] = updatedFavorites;
      }
    } catch (e) {
      throw Exception('Failed to add to favorites: $e');
    }
  }
  
  @override
  Future<List<int>> getFavourites() async {
    try {
      // Return cached favorites if available to avoid duplicate network calls
      if (_cachedFavorites != null) {
        return _cachedFavorites!;
      }
      
      final currentUser = MockDatabase.instance.currentUser;
      if (currentUser == null) {
        return <int>[];
      }
      
      _cachedFavorites = currentUser['favourite'] == null
          ? <int>[]
          : List<int>.from(currentUser['favourite']);
      return _cachedFavorites!;
    } catch (e) {
      log('Error fetching products in mock favorites: $e');
      throw Exception('حدث خطأ في تحميل المنتجات.');
    }
  }
  
  @override
  Future<void> removeFromFavourite({required int itemId}) async {
    try {
      await Future.delayed(const Duration(milliseconds: 400));
      final currentUser = MockDatabase.instance.currentUser;
      if (currentUser == null) {
        throw Exception('User not authenticated');
      }
      final List<int> favourites = await getFavourites();
      if (favourites.contains(itemId)) {
        favourites.remove(itemId);
        _cachedFavorites = favourites; // Update cache first for instant UI update
        currentUser['favourite'] = favourites;
      }
    } catch (e) {
      throw Exception('Failed to remove from favorites: $e');
    }
  }
  
  @override
  Future<bool> isFavourite({required int productid}) async {
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
    _userId = null;
  }
}
