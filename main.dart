import 'dart:io';

import 'controllers/user_controller.dart';
import 'data/dummy_user.dart';

void main() {
  UserController userController = UserController();

  // Load data dari dummy file
  userController.loadData(customerData: customerUser, adminData: adminUser);

  while (true) {
    print("\n===== MENU USER MANAGEMENT =====");
    print("1. Login User");
    print("2. Cari User berdasarkan email");
    print("3. Tampilkan semua User urut berdasarkan email");
    print("4. Cari Admin berdasarkan permission");
    print("5. Cari Customer berdasarkan kota/daerah");
    print("6. Keluar");
    stdout.write("Pilih menu (1-6): ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write("Masukkan email: ");
        String? email = stdin.readLineSync();
        stdout.write("Masukkan password: ");
        String? password = stdin.readLineSync();

        userController.checkLogin(email: email ?? "", password: password ?? "");
        break;

      case '2':
        stdout.write("Masukkan email yang dicari: ");
        String? email = stdin.readLineSync();
        userController.searchUser(email ?? '');
        break;

      case '3':
        userController.sortUsersByEmail();
        break;

      case '4':
        stdout.write(
          "Masukkan permission admin yang ingin dicari (add/edit/view/delete): ",
        );
        String? permission = stdin.readLineSync();
        userController.getListUserAdminByPermission(permission ?? '');
        break;

      case '5':
        stdout.write("Masukkan nama kota/daerah: ");
        String? city = stdin.readLineSync();
        userController.getListUserCustomerByCity(city ?? '');
        break;

      case '6':
        print("👋 Keluar dari aplikasi. Sampai jumpa!");
        exit(0);

      default:
        print("⚠️ Pilihan tidak valid! Silakan pilih menu 1–6.");
    }
  }
}
