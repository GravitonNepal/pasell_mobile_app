
import 'package:pasell/Controller/ProductController.dart';
import 'package:pasell/Models/Product/FavoriteProduct.dart';

import '../../Helpers/BaseServerUrl.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../Widgets/BottomNavigationFrave.dart';
import '../../Widgets/CustomText.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 246, 246),
      appBar: AppBar(
        title: CustomText(
          text: 'Favorites',
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Color(0xfff2f2f2),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          FutureBuilder<List<Favorite>>(
            future: dbProductController.favoriteProducts(),
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? LoadingFavoriteProduct()
                  : ListFavoriteProduct(list: snapshot.data);
            },
          ),
          Positioned(
            bottom: 20,
            child: Container(
                width: size.width,
                child: Align(child: BottomNavigationFrave(index: 1))),
          ),
        ],
      ),
    );
  }
}

class LoadingFavoriteProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Color(0xFFF5F5F5),
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 90),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 25,
            mainAxisSpacing: 25,
            mainAxisExtent: 210),
        itemCount: 6,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25.0)),
        ),
      ),
    );
  }
}

class ListFavoriteProduct extends StatelessWidget {
  final List<Favorite> list;

  ListFavoriteProduct({this.list});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: 15.0, top:20.0, right: 15.0, bottom: 90),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 25,
            mainAxisSpacing: 20,
            mainAxisExtent: 220),
        itemCount: list.length == null ? 0 : list.length,
        itemBuilder: (context, i) => ProductFavorite(product: list[i]));
  }
}

class ProductFavorite extends StatelessWidget {
  final Favorite product;

  ProductFavorite({this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          children: [
            Image.network(publicServerUrl + product.productId.picture,
                height: 140),
            CustomText(
                text: product.productId.nameProduct,
                fontSize: 17,
                textOverflow: TextOverflow.ellipsis),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: CustomText(
                  text: '\Rs ${product.productId.price}',
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
