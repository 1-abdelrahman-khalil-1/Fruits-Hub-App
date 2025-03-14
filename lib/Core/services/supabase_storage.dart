import 'dart:developer';

import 'package:fruitsapp/Core/errors/Customexception.dart';
import 'package:fruitsapp/Core/services/storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorage implements StorageService {
 static late Supabase _supabase ;
  
  static Future<void> init() async{
   _supabase = await Supabase.initialize(
      url: 'https://tlxazsbcnzpviobfefme.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRseGF6c2JjbnpwdmlvYmZlZm1lIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTczODc0Nzc4MiwiZXhwIjoyMDU0MzIzNzgyfQ.2U5zi4F1et-aLZxp_NwX005yAlnCGwxMa3lHpy0wRfo',
    );
  }
  
  @override
  Future<List<Map<String, dynamic>>> fetchProducts({required String collectionname, required String order}) async{ 
   try {
      final response = await _supabase.client
          .from(collectionname)
          .select()
          .order(order, ascending: true);
      return response;
    } catch (e) {
      log('Error fetching products in supabase: $e');
      throw Customexception(message: 'حدث خطأ في التحميل المنتجات. ');
    }
  }
  @override
 Future<Map<String, dynamic>> fetchProduct({ required String collectionname,required int productid}) async {
  try {
      final  response = await _supabase.client
          .from(collectionname)
          .select()
          .eq('id', productid);
      return response[0];
    } catch (e) {
      log('Error fetching product data in supabase: $e');
      throw Customexception(message: 'حدث خطأ في التحميل المنتج.');
    }
  }
  @override
  Future<List<Map<String,dynamic>>> priceFiltering({required String collectionname ,required bool ascending , required bool alpabatical}) async {
    try {
      final  response = await _supabase.client
          .from(collectionname)
          .select()
          .order( alpabatical? 'name' : 'price', ascending: ascending);
      return response;
    } catch (e) {
      log('Error fetching product data after filtering in supabase: $e');
      throw Customexception(message: 'حدث خطأ في التحميل.');
    }
  }
  

  
  
}