import 'dart:convert';
import 'package:pasell/Models/Home/CategoriesProducts.dart';

import '../Helpers/BaseServerUrl.dart';
import 'package:http/http.dart' as http;
import '../Models/Home/ProductHome.dart';
import 'AuthController.dart';
import '../Models/Home/HomeCarousel.dart';

// import '../Models/Home/CategoriesProducts.dart';

class HomeController {
  String server = baseServerUrl;

  Future<List<SliderHome>> getHomeCarouselSlider() async {
    final token = await authController.readToken();

    final resp = await http.get(Uri.parse('$server/home-carousel'),
        headers: {'Accept': 'application/json', 'xx-token': token});

    return HomeCarousel.fromJson(jsonDecode(resp.body)).slider;
  }

  Future<List<Category>> getListCategoriesProducts() async {
    final token = await authController.readToken();

    final resp = await http.get(Uri.parse('$server/list-categories'),
        headers: {'Accept': 'application/json', 'xx-token': token});

    return CategoriesProducts.fromJson(jsonDecode(resp.body)).categories;
  }

  Future<List<Product>> getListProductsHome() async {
    final token = await authController.readToken();

    final resp = await http.get(Uri.parse('$server/list-products-home'),
        headers: {'Accept': 'application/json', 'xx-token': token});

    return ProductsHome.fromJson(jsonDecode(resp.body)).products;
  }

  Future<List<Category>> getListCategories() async {
    final token = await authController.readToken();

    final resp = await http.get(Uri.parse('$server/list-categories-all'),
        headers: {'Accept': 'application/json', 'xx-token': token});

    return CategoriesProducts.fromJson(jsonDecode(resp.body)).categories;
  }

// search
  Future<List<Product>> getsearchResults(keyword) async {
    final resp = await http.get(
      Uri.parse('$server/search/$keyword'),
      headers: {'Accept': 'application/json'},
    );
    // print(resp[0]);

    return ProductsHome.fromJson(jsonDecode(resp.body)).products;
  }
}

final dbHomeController = HomeController();
