// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:html';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
// import 'package:http/http.dart';

import 'package:pasell/Models/Home/ProductHome.dart';
import 'package:pasell/Models/ResponseModels.dart';
import 'package:pasell/Views/Search/searchResult.dart';

import '../../Controller/AuthController.dart';
import '../../Controller/ProductController.dart';
import '../../Helpers/BaseServerUrl.dart';
import '../../Models/AuthModel.dart';
import '../../Controller/HomeController.dart';

class CommentBar extends StatefulWidget {
  // final Product product;
  final String uidproduct;
  final String uiduser;
  CommentBar({
    Key key,
    this.uidproduct,
    this.uiduser,
  }) : super(key: key);

  @override
  State<CommentBar> createState() => _CommentBarState();
}

class _CommentBarState extends State<CommentBar> {
  final commentcontroller = TextEditingController();
  String server = baseServerUrl;

  final secureStorage = FlutterSecureStorage();
  Future<String> readToken() async {
    return secureStorage.read(key: 'xtoken');
  }

  List<Product> listProduct = [];
  List<Users> users = [];
  getProducts() async {
    listProduct = await dbProductController.getproductid(id: widget.uidproduct);
    setState(() {});
  }

  getuser() async {
    users = await dbProductController.getuserid(id: widget.uiduser);
    setState(() {});
  }

  Future<bool> addcomment() async {
    final token = await authController.readToken();
    Map<String, dynamic> blogdata = {
      'uidProduct': widget.uidproduct,
      'comment': commentcontroller.text,
      "uidUser": widget.uiduser
    };
    try {
      final resp = await http.post(Uri.parse('$server/comment'),
          headers: {
            'Accept': 'application/json',
            "xx-token": token,
          },
          body: blogdata);
      var data = jsonDecode(resp.body) as Map;
      print(data);
      return data['success'];
    } catch (e) {
      print(e);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: 42,
                // width: 100,
                margin: const EdgeInsets.only(left: 18, top: 10, right: 18),
                child: Material(
                  borderRadius: BorderRadius.circular(7),
                  elevation: 1,
                  child: TextFormField(
                    // onFieldSubmitted: (value) => navigateToSearchScreen,
                    controller: commentcontroller,
                    decoration: InputDecoration(
                      prefixIcon: InkWell(
                        onTap: () {
                          print("ok");
                          addcomment();
                          // addComment(product, users);
                          // submitComment(user, product, comment);
                          // getProducts();
                          // getuser();

                          commentcontroller.text;
                          print(commentcontroller.text);
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(left: 0),
                          child: Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 23,
                          ),
                        ),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 240, 239, 239),
                      contentPadding: const EdgeInsets.only(top: 10),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: Colors.black38,
                          width: 1,
                        ),
                      ),
                      hintText: 'Search',
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
