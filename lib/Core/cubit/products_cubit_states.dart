import 'package:fruitsapp/Core/model/productmodel.dart';

abstract class ProductsCubitStates {}
class InitialState extends ProductsCubitStates {}
class LoadingState extends ProductsCubitStates {}
class SuccessState extends ProductsCubitStates {
  List<Productmodel> products;
  Productmodel product;
  SuccessState(this.products , this.product);
  
}
class ErrorState extends ProductsCubitStates {
  String message;
  ErrorState({required this.message});
}