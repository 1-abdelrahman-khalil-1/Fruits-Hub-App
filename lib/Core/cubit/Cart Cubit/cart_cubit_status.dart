import 'package:equatable/equatable.dart';

import '../../model/cartmodel.dart';

abstract class CartCubitStatus extends Equatable {
  @override
  List<Object> get props => [];
}
class InitialCartCubit extends CartCubitStatus {}
class CartCubitAdded extends CartCubitStatus {
  final List<CartItem> products ;
@override
  List<Object> get props => [products];
  CartCubitAdded({required this.products});

}
class CartCubitError extends CartCubitStatus {}