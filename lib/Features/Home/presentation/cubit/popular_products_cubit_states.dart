import 'package:fruitsapp/Features/Home/Data/model/productmodel.dart';

abstract class PopularProductsCubitStates {}
class InitialState extends PopularProductsCubitStates {}
class LoadingState extends PopularProductsCubitStates {}
class SuccessState extends PopularProductsCubitStates {
  List<Productmodel> products;
  SuccessState({required this.products});
}
class ErrorState extends PopularProductsCubitStates {
  String message;
  ErrorState({required this.message});
}