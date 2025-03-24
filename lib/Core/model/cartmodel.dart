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
 int get totalprice => count * product.price;
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
     for (var i = 0; i < cartItems.length; i++) {
       if (cartItems[i].product.id == product.id) {
         cartItems[i].increaseCount();
         break;
       }
     }
   }
 }
 void removeItem(CartItem item){
  cartItems.remove(item);
 }
void updateCart(CartItem cartitem){
  for (var i = 0; i < cartItems.length; i++) {
    if (cartItems[i].product.id == cartitem.product.id) {
      cartItems[i].count += cartitem.count-1;
      break;
    }
  }
}
int get totalprice{
  int total = 0;
   for (var item in cartItems) {
     total += item.totalprice;
   }
   return total;
 }
}