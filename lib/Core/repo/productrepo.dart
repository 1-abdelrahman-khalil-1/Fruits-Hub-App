import 'package:dartz/dartz.dart';
import 'package:fruitsapp/Core/model/productmodel.dart';

abstract class Productrepo {
  Future<Either<String ,  List<Productmodel>>> fetchProducts({required String collectionname}) ;
  Future<Either<String ,  Productmodel>> fetchProductData({required String collectionname,required int productid});
  Future<Either<String , List<Productmodel>>> priceFiltering({required String collectionname ,required bool ascending, required bool alpabatical});
  
}