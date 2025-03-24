import 'package:contact_diary_app/screen/addcontact/add_contact_screen.dart';
import 'package:contact_diary_app/screen/backup_contact_screen/backup_contact_screen.dart';
import 'package:contact_diary_app/screen/home/home_screen.dart';
import 'package:contact_diary_app/screen/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static String splash = '/';
  static String home = '/home';
  static String addContact = '/addContact';
  static String backupContact = '/backupContact';

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: addContact, page: () => const AddEditContactScreen()),
    GetPage(name: backupContact, page: () => const BackupContactsScreen()),
  ];
}
