import 'package:fruitsapp/Core/model/productmodel.dart';
class CartItem{
final Productmodel product;
 int count ;
 CartItem(this.product , {this.count=1});
 void increaseCount(){
  count++;
 }
 void decreaseCount(){
      if(count!=0){
        count--;
      }
 }
}

class Cartmodel {
  List<CartItem> cartItems;
 Cartmodel({required this.cartItems});
bool isItemExist(Productmodel product){
  for (var item in cartItems) {
     if (item.product.id == product.id) {
       return true;
     }
   }
   return false;
 }
 void addItem(Productmodel product){
  if (!isItemExist(product)) {
     cartItems.add(CartItem(product));
   } else {
     for (var item in cartItems) {
       if (item.product == product) {
         item.increaseCount();
         break;
       }
     }
   }
 }
 void removeItem(CartItem item){
  cartItems.remove(item);
 }
void updateCart(CartItem cartitem){
   for (var item in cartItems) {
       if (item.product == cartitem.product) {
         item = cartitem;
         break;
       }
     }
}
}