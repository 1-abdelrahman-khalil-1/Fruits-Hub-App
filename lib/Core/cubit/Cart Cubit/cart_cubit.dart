
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/cartmodel.dart';
import '../../model/productmodel.dart';
import 'cart_cubit_status.dart';

class CartCubit extends Cubit<CartCubitStatus>{
  CartCubit() : super(InitialCartCubit());

var  cartProducts =  Cartmodel(cartItems: []);
  void addProductToCart({required Productmodel product}) {
    cartProducts.addItem(product);
    print(cartProducts.cartItems);
    emit(CartCubitAdded(products: cartProducts.cartItems));
  }
  void removeProductFromCart({required CartItem product}) {
    cartProducts.removeItem(product);
    emit(CartCubitAdded(products: cartProducts.cartItems));
  }
void updateProductInCart({required CartItem product}) {
    cartProducts.updateCart(product);
    emit(CartCubitAdded(products: cartProducts.cartItems));
  }

}
