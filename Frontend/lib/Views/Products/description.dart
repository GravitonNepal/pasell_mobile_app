import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:pasell/Bloc/bloc/product_bloc.dart';
import 'package:pasell/Controller/HomeController.dart';

import '../../Helpers/BaseServerUrl.dart';
// import '../../Helpers/ModalAddCart.dart';
import '../../Models/Home/ProductHome.dart';
// import '../../Models/Product.dart';
import '../../Widgets/CustomText.dart';
import 'DetailsProductPage.dart';

class Description extends StatelessWidget {
  final Product product;
  Description({this.product});

  @override
  Widget build(BuildContext context) {
    // final productBloc = BlocProvider.of<ProductBloc>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<List<Product>>(
        future: dbHomeController.getListProductsHome(),
        builder: (context, snapshot) {
          List<Product> list = snapshot.data;
          print("$list, this is snapshot of data");
          return !snapshot.hasData
              ? CircularProgressIndicator
              : Scrollbar(
                  child: GridView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        // crossAxisSpacing: 25,
                        mainAxisSpacing: 8,
                        mainAxisExtent: 150),
                    itemCount: list.length == null ? 0 : list.length,
                    itemBuilder: (context, i) => Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(217, 244, 240, 240),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) =>
                                    DetailsProductPage(product: list[i]))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width * 0.4,
                                  width: 150,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        scale: 2.0,
                                        image: NetworkImage(
                                            publicServerUrl + list[i].picture),
                                      ),
                                    ),
                                  )),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 5, right: 0, bottom: 0, top: 7),
                                  child: Text(
                                    list[i].nameProduct,
                                    style: GoogleFonts.getFont('Roboto',
                                        fontSize: 19,
                                        fontWeight: FontWeight.w400),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5, right: 00, bottom: 0, top: 7),
                                  child: CustomText(
                                    text: '\Rs ${list[i].price}',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                // CustomText(text: , fontSize: 20),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
