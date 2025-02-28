
abstract class StorageService {
Future<List<Map<String, dynamic>>> fetchProducts({required String collectionname}) ;
Future<Map<String, dynamic>> fetchProduct({required String collectionname,required int productid}) ;
}
