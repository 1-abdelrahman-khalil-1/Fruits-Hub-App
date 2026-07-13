import 'package:fruitsapp/Core/model/productmodel.dart';

Productmodel dummyProduct() {
  return Productmodel(
      id: 0,
      name: 'Apple',
      price: 0,
      imageUrl:
          'https://images.unsplash.com/photo-1553279768-865429fa0078?w=400&q=80',
      category: "Fruits",
      description: '',
      organic: true,
      calories: 200,
      sellingCount: 0);
}

List<Productmodel> dummyProducts() {
  return [dummyProduct(), dummyProduct(), dummyProduct(), dummyProduct()];
}
