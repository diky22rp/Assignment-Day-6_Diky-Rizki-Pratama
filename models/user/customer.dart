import 'user.dart';

class Customer extends User {
  String name;
  String address;

  Customer(String email, String password, this.name, this.address)
    : super(email, password);

  @override
  void showDetails() {
    print("Email: $email");
    print("Name: $name");
    print("Address: $address");
  }

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      json["email"],
      json["password"],
      json["name"],
      json["address"],
    );
  }
}
