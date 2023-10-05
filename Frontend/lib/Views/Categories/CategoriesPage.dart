import 'package:pasell/Views/Categories/CategoryProductsPage.dart';

import '../../Controller/HomeController.dart';
import '../../Helpers/BaseServerUrl.dart';
// ignore: unused_import
import '../../Helpers/Colors.dart';
import '../../Models/Home/CategoriesProducts.dart';
import '../../Widgets/AnimationRoute.dart';
import '../../Widgets/CustomText.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        title: CustomText(text: 'Category', color: Colors.black),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Category>>(
        future: dbHomeController.getListCategories(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? Center(
                  child: Row(
                  children: [
                    CircularProgressIndicator(),
                    CustomText(text: 'Loading...')
                  ],
                ))
              : ListCategories(list: snapshot.data);
        },
      ),
    );
  }
}

class ListCategories extends StatelessWidget {
  final List<Category> list;

  ListCategories({this.list});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          mainAxisExtent: 180),
      itemCount: list.length == null ? 0 : list.length,
      itemBuilder: (context, i) => GestureDetector(
          child: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(color: Colors.black12)),
            child: Column(
              children: [
                Container(
                  height: 100,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Image.network(
                    publicServerUrl + list[i].picture,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10.0),
                CustomText(text: list[i].category, fontSize: 20)
              ],
            ),
          ),
          onTap: () => Navigator.of(context).push(customRoute(
              page: CategoryProductsPage(
                  uidCategory: list[i].id, category: list[i].category),
              curved: Curves.linearToEaseOut))),
    );
  }
}
