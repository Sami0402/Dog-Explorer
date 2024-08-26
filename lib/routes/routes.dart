import 'package:dog_explorer/navbar/navbar.dart';
import 'package:dog_explorer/screens/home_screen/home.dart';
import 'package:dog_explorer/screens/saved_dog_screen/saved_dog_screen.dart';
import 'package:dog_explorer/screens/search_screen/search_screen.dart';
import 'package:get/get.dart';

class AppPage {
  static List<GetPage> routes = [
    GetPage(name: navbar, page: () => Navbar()),
    GetPage(name: home, page: () => Home()),
    GetPage(name: search, page: () => SearchScreen()),
    GetPage(name: saved, page: () => SavedDogsScreen()),
  ];

  static getnavbar() => navbar;
  static gethome() => home;
  static getsearch() => search;
  static getsaved() => saved;

  static String navbar = '/';
  static String home = '/home';
  static String search = '/search';
  static String saved = '/saved';
}
