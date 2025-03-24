import 'package:flutter_bloc/flutter_bloc.dart';
part 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit() : super(CartItemInitial());
  void updateCartItem() {
    emit(CartItemUpdated());
  }
}
