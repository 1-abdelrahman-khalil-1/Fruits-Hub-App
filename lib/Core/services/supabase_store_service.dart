import 'package:fruitsapp/Core/services/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStoreService implements Services {
  final SupabaseClient _supabase = Supabase.instance.client;
  @override
  Future<void> adduserData({required String collectionname,required Map<String, dynamic> data}) async {
    await _supabase.from(collectionname).upsert(data, onConflict: 'id');
  }

  @override
  Future<Map<String, dynamic>> getUserData({ required String collectionname,required String uid}) async {
    final response =
        await _supabase.from(collectionname).select().eq('id', uid).single();
    return response;
  }
}
