import '../models/user/user_model.dart';

class UserController {
  List<Customer> customers = [];
  List<Admin> admins = [];

  void loadData({
    required List<Map<String, dynamic>> customerData,
    required List<Map<String, dynamic>> adminData,
  }) {
    customers = customerData.map((e) => Customer.fromJson(e)).toList();
    admins = adminData.map((e) => Admin.fromJson(e)).toList();
  }

  bool checkLogin({required String email, required String password}) {
    //mandatory check
    if (email == "" || password == "") {
      print('❌ Opps, Email dan Password tidak boleh kosong!');
      return false;
    }

    //cek email valid
    if (!checkValidEmail(email)) {
      print('❌ Email tidak valid!');
      return false;
    }

    for (var user in customers) {
      if (user.login(email, password)) {
        print("✅ Login berhasil sebagai: ${email}");
        return true;
      }
    }

    for (var admin in admins) {
      if (admin.login(email, password)) {
        print("✅ Login berhasil sebagai: ${email}");
        return true;
      }
      ;
    }

    print("❌ Email atau password salah!");
    return false;
  }

  void searchUser(String email) {
    //mandatory check
    if (email == "") {
      print('❌ Opps, Email tidak boleh kosong!');
      return;
    }
    if (!checkValidEmail(email)) {
      print('❌ Email tidak valid!');
      return;
    }

    var user = [
      ...customers,
      ...admins,
    ].firstWhere((u) => u.email == email, orElse: () => User('Not found', ''));

    if (user.email == 'Not found') {
      print("⚠️ User tidak ditemukan.");
    } else {
      print("🔎 Data user ditemukan:");
      user.showDetails();
    }
  }

  void getListUserAdminByPermission(String permission) {
    //mandatory check
    if (permission == "") {
      print('❌ Opps, Permission tidak boleh kosong!');
      return;
    }

    var result = admins
        .where((u) => u.permissions.contains(permission))
        .toList();

    if (result.isEmpty) {
      print("⚠️ Tidak ada admin dengan permission '$permission'.");
    } else {
      print("Daftar admin dengan permission '$permission':");
      for (var admin in result) {
        print("- ${admin.email} (${admin.permissions.join(', ')})");
      }
    }
  }

  void getListUserCustomerByCity(String city) {
    //mandatory check
    if (city == "") {
      print('❌ Opps, Nama kota/daerah tidak boleh kosong!');
      return;
    }

    var result = customers.where((u) => u.address.contains(city)).toList();

    if (result.isEmpty) {
      print("⚠️ Tidak ada customer dengan daerah '$city'.");
    } else {
      print("Daftar customer dengan daerah '$city':");
      for (var customers in result) {
        print("- ${customers.email} (${customers.address})");
      }
    }
  }

  void sortUsersByEmail() {
    var checkAllUsers = [...customers, ...admins];
    checkAllUsers.sort((a, b) => a.email.compareTo(b.email));
    print("Urutan user berdasarkan email:");
    for (var u in checkAllUsers) {
      print("- ${u.email}");
    }
  }

  bool checkValidEmail(String email) {
    return email.contains('@') && email.contains('.');
  }
}
