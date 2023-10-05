// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:pasell/Views/Home/HomePage.dart';

import 'package:pasell/Views/Products/DetailsProductPage.dart';

import '../../Bloc/bloc/product_bloc.dart';
import '../../Controller/HomeController.dart';
import '../../Controller/ProductController.dart';
import '../../Helpers/BaseServerUrl.dart';
import '../../Models/Home/ProductHome.dart';
import '../../Models/Product.dart';
import '../../Widgets/AnimationRoute.dart';
import '../../Widgets/CustomText.dart';
import '../Cart/CartPage.dart';

class SearchResults extends StatefulWidget {
  static const String routeName = '/search-screen';
  // SearchResults({Key key}) : super(key: key);
  final String keyword;
  final server = baseServerUrl;
  final String uidCategory;
  final String category;
  SearchResults({
    Key key,
    this.keyword,
    this.uidCategory,
    this.category,
  }) : super(key: key);

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  // List<Product> listProduct = [];

  getDest() async {
    var res = await http.get(
        Uri.parse("http://192.168.1.64:8471" + '/api/search/${widget.keyword}'),
        headers: {'Accept': 'application/json'});
    var data = jsonDecode(res.body) as Map;
    print(data["products"]);
    print("as");
    return data['products'];
  }

  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<ProductBloc>(context);

    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        title: Text(
          "Search",
          style: GoogleFonts.getFont('Roboto',
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () => Navigator.of(context)
              .push(customRoute(page: HomePage(), curved: Curves.easeInOut)),
        ),
      ),
      body: FutureBuilder(
          future: getDest(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, mainAxisSpacing: 6, mainAxisExtent: 150),
                itemCount:
                    snapshot.data.length == null ? 0 : snapshot.data.length,
                itemBuilder: (context, i) => Card(
                  color: Color.fromARGB(255, 250, 249, 249),
                  // shadowColor: Colors.black26,
                  margin: EdgeInsets.only(left: 16, right: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 5.0,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    splashColor: Colors.blue[300],
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => DetailsProductPage(
                            product: snapshot.data.listProduct[i]))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              scale: 1.0,
                              image: NetworkImage(
                                publicServerUrl + snapshot.data[i]["picture"],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${snapshot.data[i]['price']}",
                                maxLines: 3,
                                style: GoogleFonts.getFont('Roboto',
                                    fontSize: 17, fontWeight: FontWeight.w500),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              // Stars(rating: totalRating),
                              CustomText(
                                  text:
                                      '\Rs ${snapshot.data[i]['nameProduct']}',
                                  fontSize: 16),
                              const Text(
                                'status: used',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 14, 14, 14)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return Center(child: const CircularProgressIndicator());
          }),
    );
  }
}
