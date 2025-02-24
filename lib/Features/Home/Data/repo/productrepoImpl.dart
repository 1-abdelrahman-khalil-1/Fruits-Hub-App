import 'package:dartz/dartz.dart';
import 'package:fruitsapp/Core/errors/Customexception.dart';
import 'package:fruitsapp/Core/services/storage_service.dart';
import 'package:fruitsapp/Features/Home/Data/model/productmodel.dart';
import 'package:fruitsapp/Features/Home/Data/repo/productrepo.dart';

class ProductrepoImp implements Productrepo {
  StorageService storage;
  ProductrepoImp({required this.storage});
  @override
  Future<Either<String,  List<Productmodel>>> fetchProductData({required String collectionname}) async {
    try {
      final response = await storage.fetchProductData(collectionname: collectionname);
      List<Productmodel> products = response.map((map) => Productmodel.FromJson(map)).toList();
      return Right(products);
    }on Customexception catch (e) {
      return Left(e.message);
    }
  }

}