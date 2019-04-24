import 'dart:convert';

class Response {
  num code;
  String message;
  List results;

  Response({this.code, this.message, this.results});
  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
        code: json['code'], message: json['message'], results: json['results']);
  }
}

class User {
  int id;
  String firstName, lastName, email;
  bool vip;
  String dateOfBirth;
  List<Address> shippingAddresses;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.vip,
    this.dateOfBirth,
    this.shippingAddresses,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    var list = json['shippingAddresses'] as List;
    List<Address> addressList = list.map((i) => Address.fromJson(i)).toList();
    return new User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      vip: json['vip'],
      dateOfBirth: json['dateOfBirth'],
      shippingAddresses: addressList,
    );
  }

  Response resultJson(jsonString) {
    final result = json.decode(jsonString);
    final response = Response.fromJson(result);
    final list = response.results;
    List<User> userList = list.map((i) => User.fromJson(i)).toList();
    final results = userList.cast<User>();
    response.results = userList.cast<User>();
    return response;
  }
}

class Address {
  String address, city, state, country, zipcode;

  Address({
    this.address,
    this.city,
    this.state,
    this.country,
    this.zipcode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        address: json['address'],
        city: json['city'],
        state: json['state'],
        country: json['country'],
        zipcode: json['zipcode']);
  }
}
