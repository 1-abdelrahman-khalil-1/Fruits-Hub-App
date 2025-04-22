class Productmodel {
   int id;
   String name;
   int price;
   String description;
   int sellingCount;
  bool organic = false;
   int calories;
   String imageUrl;
   String category;

  Productmodel(
      {required this.id,
      required this.name,
      required this.price,
      required this.description,
      required this.organic,
      required this.sellingCount,
      required this.calories,
      required this.imageUrl,
      required this.category});

 Map<String,dynamic> toMap () {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'sellingCount':sellingCount,
      'organic': organic ? 1 : 0,
      'calories': calories,
      'imageUrl': imageUrl,
      'category': category
    };
  }
 factory Productmodel.FromJson(Map<String,dynamic> json) {
  return Productmodel(
    id: json['id'],
    name: json['name'],
    price: json['price'],
    description: json['description'],
    sellingCount: json['sellingCount'],
    organic: json['organic'],
    calories: json['calories'],
    imageUrl: json['imageUrl'],
    category: json['category']
  );
  }
 }   

