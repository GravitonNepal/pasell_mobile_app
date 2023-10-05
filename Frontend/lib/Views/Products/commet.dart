import 'package:flutter/material.dart';
import 'package:pasell/Views/Home/HomePage.dart';
import 'package:pasell/Views/Products/DetailsProductPage.dart';
// import 'package:pasell/Views/Products/Comment.dart';
import 'package:pasell/Views/Products/comment/test.dart';
import 'package:pasell/Views/Products/description.dart';

import '../comment/widgetcomment.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SizedBox(
        height: 500,
        child: Column(
          children: <Widget>[
            Container(
              color: Color.fromARGB(255, 250, 249, 248),
              child: TabBar(
                unselectedLabelColor: Color.fromARGB(255, 13, 13, 13),
                // labelStyle: Colors.black,
                labelColor: Color.fromARGB(255, 27, 27, 28),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 2,
                indicatorColor: Color.fromARGB(255, 13, 13, 14),
                // indicatorSize: TabBarIndicatorSize.tab,
                // indicatorPadding: const EdgeInsets.all(50),
                tabs: <Widget>[
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Recently Added",
                        style: TextStyle(fontFamily: "Lato", fontSize: 15),
                        // textDirection:
                      ),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Comment",
                        style: TextStyle(fontFamily: "Lato", fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  Description(),
                  CommentBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
