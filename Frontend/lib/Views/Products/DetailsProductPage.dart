import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pasell/Views/Products/commet.dart';

import '../../Bloc/bloc/product_bloc.dart';
import '../../Helpers/BaseServerUrl.dart';
// ignore: unused_import
import '../../Helpers/Colors.dart';
import '../../Helpers/ModalAddCart.dart';
import '../../Models/Home/ProductHome.dart';
import '../../Models/Product.dart';
import '../../Widgets/AnimationRoute.dart';
import '../../Widgets/CustomText.dart';
import '../Cart/CartPage.dart';
import '../Home/HomePage.dart';

class DetailsProductPage extends StatefulWidget {
  final Product product;
  DetailsProductPage({
    @required this.product,
  });

  @override
  State<DetailsProductPage> createState() => _DetailsProductPageState();
}

class _DetailsProductPageState extends State<DetailsProductPage> {
  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<ProductBloc>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.only(top: 10.0, bottom: 100.0),
              children: [
                _AppBarProduct(
                    nameProduct: widget.product.nameProduct,
                    uidProduct: widget.product.id),
                SizedBox(height: 5.0),
                _ImageProduct(
                    uidProduct: widget.product.id,
                    imageProduct: widget.product.picture),
                SizedBox(height: 15.0),

                Padding(
                  padding: EdgeInsets.only(left: 10, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomText(
                        text: widget.product.nameProduct,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                      CustomText(
                          text: '\Rs ${widget.product.price}',
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                    ],
                  ),
                ),

                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: CustomText(
                      text: 'Description',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.0,
                  ),
                  child: Wrap(
                    children: [
                      CustomText(
                        text: (widget.product.description),
                        fontSize: 15,
                        // fontWeight: FontWeight.normal,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30.0),

                Home(),

                Divider(
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                )
                // Container(
                //   height: 400,
                //   // width: 400,
                //   color: Colors.black,
                // ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.grey[200], blurRadius: 15, spreadRadius: 5)
                ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 40.h,
                      width: 150.h,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(85, 83, 177, 1),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: TextButton(
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                        child: CustomText(
                            text: 'Add To Cart',
                            color: Colors.white,
                            fontSize: 18),
                        onPressed: () async {
                          modalAddCartSuccess(context, widget.product.picture);

                          // ignore: non_constant_identifier_names
                          final Productselect = ProductCart(
                              uidProduct: widget.product.id,
                              image: widget.product.picture,
                              name: widget.product.nameProduct,
                              price: widget.product.price.toDouble(),
                              amount: 1);

                          productBloc
                              .add(AddProductToCart(product: Productselect));
                          await Future.delayed(Duration(seconds: 2));
                          Navigator.pop(context);
                          Navigator.of(context).push(customRoute(
                              page: HomePage(), curved: Curves.easeInOut));
                        },
                      ),
                    ),
                    Container(
                      height: 40.h,
                      width: 150.h,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(85, 83, 177, 1),
                          borderRadius: BorderRadius.circular(10.h)),
                      child: TextButton(
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                        child: CustomText(
                            text: 'Order Now',
                            fontSize: 18,
                            color: Colors.white),
                        onPressed: () {
                          final productselect = ProductCart(
                              uidProduct: widget.product.id,
                              image: widget.product.picture,
                              name: widget.product.nameProduct,
                              price: widget.product.price.toDouble(),
                              amount: 1);

                          productBloc
                              .add(AddProductToCart(product: productselect));

                          Navigator.of(context).push(customRoute(
                              page: CartPage(), curved: Curves.easeInOut));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ImageProduct extends StatelessWidget {
  final String imageProduct;
  final String uidProduct;

  const _ImageProduct({this.uidProduct, this.imageProduct});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Hero(
        tag: '$uidProduct',
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width / 1,
            child: Image.network(
              publicServerUrl + imageProduct,
              fit: BoxFit.cover,
              height: 200,
              width: MediaQuery.of(context).size.height,
            ),
          ),
        ),
      ),
    );
  }
}

class _AppBarProduct extends StatefulWidget {
  final String nameProduct;
  final String uidProduct;

  const _AppBarProduct({this.nameProduct, this.uidProduct});

  @override
  State<_AppBarProduct> createState() => _AppBarProductState();
}

class _AppBarProductState extends State<_AppBarProduct> {
  @override
  Widget build(BuildContext context) {
    bool click = true;

    final productBloc = BlocProvider.of<ProductBloc>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 24,
            child: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
          ),
        ),
        Container(
            width: 250,
            child: Text(widget.nameProduct,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.getFont('Roboto',
                    fontSize: 20, color: Colors.black))),
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 24,
          child: IconButton(
            icon: Icon(Icons.favorite_border_rounded, color: Colors.black),
            onPressed: () => productBloc
                .add(AddOrDeleteProductFavorite(uidProduct: widget.uidProduct)),
          ),
        ),
      ],
    );
  }
}
