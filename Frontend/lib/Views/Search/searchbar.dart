// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:pasell/Views/Search/searchResult.dart';
// import '../../Controller/HomeController.dart';

class SearchBar extends StatefulWidget {
  SearchBar({Key key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final myController = TextEditingController();
  void navigateToSearchScreen(BuildContext context, String mycontroller) {
    Navigator.pushNamed(context, SearchResults.routeName,
        arguments: mycontroller.toString());
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
                    onFieldSubmitted: (value) => navigateToSearchScreen,
                    controller: myController,
                    decoration: InputDecoration(
                      prefixIcon: InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(//new
                              new MaterialPageRoute(
                                  builder: (context) => new SearchResults(
                                      keyword: myController.text) //new
                                  ) //new
                              );
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
