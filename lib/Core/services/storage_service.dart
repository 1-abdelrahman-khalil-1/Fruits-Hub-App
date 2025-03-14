

abstract class StorageService {
Future<List<Map<String, dynamic>>> fetchProducts({required String collectionname , required String order}) ;
Future<Map<String, dynamic>> fetchProduct({required String collectionname,required int productid}) ;
Future<List<Map<String ,dynamic>>> priceFiltering({required String collectionname ,required bool ascending, required bool alpabatical});

}
