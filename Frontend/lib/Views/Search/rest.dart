// import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
// import 'package:pasell/Views/Products/DetailsProductPage.dart';
// import '../../Bloc/bloc/product_bloc.dart';
// import '../../Controller/HomeController.dart';
// import '../../Helpers/BaseServerUrl.dart';
// import '../../Models/Home/ProductHome.dart';
// import '../../Models/Product.dart';
// import '../../Widgets/AnimationRoute.dart';
// import '../../Widgets/CustomText.dart';
// import '../Cart/CartPage.dart';

// class SearchResults extends StatefulWidget {
//   // SearchResults({Key key}) : super(key: key);
//   final String keyword;
//   final server = baseServerUrl;
//   SearchResults({Key key, this.keyword}) : super(key: key);

//   @override
//   State<SearchResults> createState() => _SearchResultsState();
// }

// class _SearchResultsState extends State<SearchResults> {
//   getDest() async {
//     var res = await http.get(
//         Uri.parse(
//             "http://192.168.0.110:8471" + '/api/search/${widget.keyword}'),
//         headers: {'Accept': 'application/json'});

//     var data = jsonDecode(res.body) as Map;

//     print(data["products"]);
//     print("as");

//     // print("Heloo" + data['data'][1]['thumbnail']);

//     return data['products'];
//   }

//   @override
//   Widget build(BuildContext context) {
//     final productBloc = BlocProvider.of<ProductBloc>(context);

//     return Scaffold(
//       backgroundColor: Color(0xfff5f5f5),
//       appBar: AppBar(
//         // title: CustomText(text: widget.category, color: Colors.black),
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ),
//       body: ListView.separated(
//         separatorBuilder: (BuildContext context, int index) {
//           return SizedBox(
//             height: 100,
//           );
//         },
//         itemCount: listProduct.length,
//         itemBuilder: (_, i) => Card(
//           color: Color.fromARGB(255, 250, 249, 249),
//           // shadowColor: Colors.black26,
//           margin: EdgeInsets.only(left: 16, right: 16),
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//           elevation: 5.0,
//           child: InkWell(
//             borderRadius: BorderRadius.circular(20),
//             splashColor: Colors.blue[300],
//             onTap: () => Navigator.of(context).push(MaterialPageRoute(
//                 builder: (_) => DetailsProductPage(product: listProduct[i]))),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   height: 150,
//                   width: 150,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     image: DecorationImage(
//                       fit: BoxFit.cover,
//                       scale: 1.0,
//                       image: NetworkImage(
//                         publicServerUrl + listProduct[i].picture,
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Container(
//                 //   // width: 400,
//                 //   child: Hero(
//                 //       tag: listProduct[i].id,
//                 //       // child: Image.network(
//                 //       //   publicServerUrl + listProduct[i].picture,
//                 //       //   height: 140.sm,
//                 //       // )
//                 //       ),
//                 // ),
//                 SizedBox(
//                   width: 30,
//                 ),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         listProduct[i].nameProduct,
//                         maxLines: 3,
//                         style: GoogleFonts.getFont('Roboto',
//                             fontSize: 17, fontWeight: FontWeight.w500),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       // Stars(rating: totalRating),
//                       CustomText(
//                           text: '\Rs ${listProduct[i].price}', fontSize: 16),
//                       const Text(
//                         'status: used',
//                         style:
//                             TextStyle(color: Color.fromARGB(255, 14, 14, 14)),
//                       ),
//                     ],
//                   ),
//                 ),
//                 // SizedBox(height: 10.0),
//                 // Text(
//                 //   listProduct[i].nameProduct,
//                 //   style: GoogleFonts.getFont('Roboto',
//                 //       fontSize: 17, fontWeight: FontWeight.w500),
//                 //   overflow: TextOverflow.ellipsis,
//                 // ),
//                 // CustomText(
//                 //     text: '\Rs ${listProduct[i].price}',
//                 //     fontSize: 16),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// //     FutureBuilder(
// //       future: getDest(),
// //       // initialData: InitialData,
// //       builder: (BuildContext context, AsyncSnapshot snapshot) {
// //         return ListView.separated(
// //           separatorBuilder: (BuildContext context, int index) {
// //             return SizedBox(
// //               height: 100,
// //             );
// //           },
// //           itemCount: snapshot.data.length,
// //           itemBuilder: (_, i) => Card(
// //             color: Color.fromARGB(255, 250, 249, 249),
// //             // shadowColor: Colors.black26,
// //             margin: EdgeInsets.only(left: 16, right: 16),
// //             shape:
// //                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// //             elevation: 5.0,
// //             child: InkWell(
// //               borderRadius: BorderRadius.circular(20),
// //               splashColor: Colors.blue[300],
// //               onTap: () => Navigator.of(context).push(MaterialPageRoute(
// //                   builder: (_) => DetailsProductPage(
// //                       product: snapshot.data.listProduct[i]))),
// //               child: Row(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Container(
// //                     height: 150,
// //                     width: 150,
// //                     decoration: BoxDecoration(
// //                       borderRadius: BorderRadius.circular(8),
// //                       image: DecorationImage(
// //                         fit: BoxFit.cover,
// //                         scale: 1.0,
// //                         image: NetworkImage(
// //                           publicServerUrl + snapshot.data[i].picture,
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   // Container(
// //                   //   // width: 400,
// //                   //   child: Hero(
// //                   //       tag: listProduct[i].id,
// //                   //       // child: Image.network(
// //                   //       //   publicServerUrl + listProduct[i].picture,
// //                   //       //   height: 140.sm,
// //                   //       // )
// //                   //       ),
// //                   // ),
// //                   SizedBox(
// //                     width: 30,
// //                   ),
// //                   Expanded(
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         Text(
// //                           "${snapshot.data[i]['price']}",
// //                           maxLines: 3,
// //                           style: GoogleFonts.getFont('Roboto',
// //                               fontSize: 17, fontWeight: FontWeight.w500),
// //                           overflow: TextOverflow.ellipsis,
// //                         ),
// //                         const SizedBox(
// //                           height: 5,
// //                         ),
// //                         // Stars(rating: totalRating),
// //                         CustomText(
// //                             text: '\Rs "${snapshot.data[i]['nameProduct']}",}',
// //                             fontSize: 16),
// //                         const Text(
// //                           'status: used',
// //                           style:
// //                               TextStyle(color: Color.fromARGB(255, 14, 14, 14)),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

// //         FutureBuilder(
// //             future: getDest(),
// //             builder: (context, AsyncSnapshot snapshot) {
// //               if (snapshot.hasData) {
// //                 return ListView.builder(
// //                   physics: NeverScrollableScrollPhysics(),
// //                   shrinkWrap: false,
// //                   Delegate: SliverGridDelegateWithFixedCrossAxisCount(
// //                       crossAxisCount: 1,
// //                       crossAxisSpacing: 25,
// //                       mainAxisSpacing: 20,
// //                       mainAxisExtent: 220),
// //                   itemCount:
// //                       snapshot.data.length == null ? 0 : snapshot.data.length,
// //                   itemBuilder: (context, i) => Container(
// //                     // padding: EdgeInsets.only(top: 0, bottom: 40),
// //                     decoration: BoxDecoration(
// //                       color: Color.fromARGB(255, 238, 235, 235),
// //                       borderRadius: BorderRadius.circular(15.0),
// //                     ),
// //                     child: GestureDetector(
// //                       onTap: () => Navigator.of(context).push(MaterialPageRoute(
// //                           builder: (_) =>
// //                               DetailsProductPage(product: snapshot.data[i]))),
// //                       child: Column(
// //                         // mainAxisAlignment: MainAxisAlignment.center,
// //                         children: [
// //                           SizedBox(
// //                               height: MediaQuery.of(context).size.width * 0.3,
// //                               width: double.infinity,
// //                               // height: 140,
// //                               // width: 300,
// //                               child: Container(
// //                                 height: MediaQuery.of(context).size.width * 0.3,
// //                                 width: double.infinity,
// //                                 decoration: BoxDecoration(
// //                                   borderRadius: BorderRadius.circular(8.0),
// //                                   image: DecorationImage(
// //                                     fit: BoxFit.cover,
// //                                     scale: 2.0,
// //                                     image: NetworkImage(publicServerUrl +
// //                                         snapshot.data[i]["picture"]),
// //                                   ),
// //                                 ),
// //                               )),
// //                           Column(
// //                             mainAxisAlignment: MainAxisAlignment.start,
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             children: [
// //                               // SizedBox(
// //                               //   height: 10,
// //                               // ),
// //                               Padding(
// //                                 padding: EdgeInsets.only(
// //                                     left: 5, right: 0, bottom: 0, top: 7),
// //                                 child: Text(
// //                                   "${snapshot.data[i]['nameProduct']}",
// //                                   style: GoogleFonts.getFont('Roboto',
// //                                       fontSize: 19,
// //                                       fontWeight: FontWeight.w400),
// //                                   overflow: TextOverflow.ellipsis,
// //                                 ),
// //                               ),

// //                               Padding(
// //                                 padding: const EdgeInsets.only(
// //                                     left: 5, right: 00, bottom: 0, top: 7),
// //                                 child: CustomText(
// //                                   text: '${snapshot.data[i]['nameProduct']}',
// //                                   fontSize: 12,
// //                                   fontWeight: FontWeight.w400,
// //                                 ),
// //                               ),
// //                               Row(
// //                                 children: [],
// //                               ),
// //                             ],
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 );
// //               } else if (snapshot.hasError) {
// //                 return Text('${snapshot.error}');
// //               }

// //               return Center(child: const CircularProgressIndicator());
// //             });
// //   }
// // }
