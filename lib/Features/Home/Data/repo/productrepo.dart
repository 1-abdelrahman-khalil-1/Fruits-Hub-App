import 'package:dartz/dartz.dart';
import 'package:fruitsapp/Features/Home/Data/model/productmodel.dart';

abstract class Productrepo {
  Future<Either<String ,  List<Productmodel>>> fetchProductData({required String collectionname}) ;
}