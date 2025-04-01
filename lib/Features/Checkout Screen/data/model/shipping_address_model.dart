class ShippingAddressModel {
  String? name;
  String? address;
  String? city;
  String? apartmentNumber;
  String? phone;

  ShippingAddressModel({
    this.name,
    this.address,
    this.city,
    this.apartmentNumber,
    this.phone,
  });

  ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    city = json['city'];
    phone = json['phone'];
    address = json['address'];
    apartmentNumber = json['floor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['city'] = city;
    data['phone'] = phone;
    data['address'] = address;
    data['floor'] = apartmentNumber;
    return data;
  }
  @override
  String toString() {
    return '$name \n $address, $city, شقة $apartmentNumber\n $phone';
  }
}