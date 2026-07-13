import 'dart:developer';

import 'package:fruitsapp/Core/errors/Customexception.dart';
import 'package:fruitsapp/Core/mock/mock_data.dart';
import 'package:fruitsapp/Core/services/storage_service.dart';

class SupabaseStorage implements StorageService {
  static Future<void> init() async {
    // Keep it as a no-op or silent initializer in offline mode
    log("SupabaseStorage initialized in offline mock mode.");
  }

  @override
  Future<List<Map<String, dynamic>>> fetchProducts({
    required String collectionname,
    required String order,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 400));
      var list =
          List<Map<String, dynamic>>.from(MockDatabase.instance.products);
      if (order == 'sellingCount') {
        list.sort((a, b) =>
            (b['sellingCount'] as int).compareTo(a['sellingCount'] as int));
      }
      return list;
    } catch (e) {
      log('Error fetching products in mock storage: $e');
      throw Customexception(message: 'حدث خطأ في تحميل المنتجات.');
    }
  }

  @override
  Future<Map<String, dynamic>?> fetchProduct({
    required String collectionname,
    required int productid,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 400));
      final matched = MockDatabase.instance.products.firstWhere(
        (p) => p['id'] == productid,
        orElse: () => throw Exception('Product not found'),
      );
      return matched;
    } catch (e) {
      log('Error fetching product in mock storage: $e');
      throw Customexception(message: 'حدث خطأ في تحميل المنتج.');
    }
  }

  @override
  Future<List<Map<String, dynamic>>> priceFiltering({
    required String collectionname,
    required bool ascending,
    required bool alpabatical,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 400));
      var list =
          List<Map<String, dynamic>>.from(MockDatabase.instance.products);
      if (alpabatical) {
        list.sort(
            (a, b) => (a['name'] as String).compareTo(b['name'] as String));
      } else {
        if (ascending) {
          list.sort((a, b) => (a['price'] as num).compareTo(b['price'] as num));
        } else {
          list.sort((a, b) => (b['price'] as num).compareTo(a['price'] as num));
        }
      }
      return list;
    } catch (e) {
      log('Error filtering products in mock storage: $e');
      throw Customexception(message: 'حدث خطأ في التحميل.');
    }
  }

  @override
  Future<void> addProduct({
    required String collectionname,
    required Map<String, dynamic> product,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 400));
      MockDatabase.instance.products.add(product);
    } catch (e) {
      log('Error adding product in mock storage: $e');
      throw Customexception(message: 'حدث خطأ في التحميل.');
    }
  }

  @override
  Future<void> removeProduct({
    required String collectionname,
    required int productid,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 400));
      MockDatabase.instance.products.removeWhere((p) => p['id'] == productid);
    } catch (e) {
      log('Error removing product in mock storage: $e');
      throw Customexception(message: 'حدث خطأ في التحميل.');
    }
  }

  @override
  Future<List<Map<String, dynamic>>> searchProducts({
    required String collectionname,
    required String query,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 400));
      final lower = query.toLowerCase();
      final results = MockDatabase.instance.products.where((p) {
        final name = (p['name'] as String).toLowerCase();
        final desc = (p['description'] as String).toLowerCase();
        return name.contains(lower) || desc.contains(lower);
      }).toList();
      return results;
    } catch (e) {
      log('Error searching products in mock storage: $e');
      throw Customexception(message: 'حدث خطأ في البحث عن المنتجات');
    }
  }
}
