import 'package:dartz/dartz.dart';
import 'package:fruitsapp/Core/errors/Customexception.dart';
import 'package:fruitsapp/Core/services/storage_service.dart';
import 'package:fruitsapp/Core/model/productmodel.dart';
import 'package:fruitsapp/Core/repo/productrepo.dart';

class ProductrepoImp implements Productrepo {
  StorageService storage;
  ProductrepoImp({required this.storage});
  @override
  Future<Either<String, List<Productmodel>>> fetchProducts({required String collectionname}) async {
    try {
      final response =
          await storage.fetchProducts(collectionname: collectionname);
      List<Productmodel> products =
          response.map((map) => Productmodel.FromJson(map)).toList();
      return Right(products);
    } on Customexception catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<Either<String, Productmodel>> fetchProductData({required String collectionname, required int productid}) async {
    try {
      final response = await storage.fetchProduct(
          productid: productid, collectionname: collectionname);
      Productmodel product = Productmodel.FromJson(response);
      return Right(product);
    } on Customexception catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<Either<String, List<Productmodel>>> priceFiltering({required String collectionname,required bool ascending,required bool alpabatical}) async {
    try {
      final response = await storage.priceFiltering(
          collectionname: collectionname,
          ascending: ascending,
          alpabatical: alpabatical);
      List<Productmodel> products =
          response.map((map) => Productmodel.FromJson(map)).toList();
     return Right(products);
    } on Customexception catch (e) {
     return Left(e.message);
    }
  }
}
