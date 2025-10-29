import 'user.dart';

class Admin extends User {
  List<String> permissions;

  Admin(String email, String password, this.permissions)
    : super(email, password);

  @override
  void showDetails() {
    print("Email: $email");
    // print("Permissions: ${permissions.join(', ')}");
  }

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      json["email"],
      json["password"],
      List<String>.from(json['permissions']),
    );
  }
}
