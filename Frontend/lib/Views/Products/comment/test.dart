import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pasell/Views/Products/comment/comment.dart';

class TestMe extends StatefulWidget {
  @override
  _TestMeState createState() => _TestMeState();
}

class _TestMeState extends State<TestMe> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List filedata = [
    {
      'name': 'Chuks Okwuenu',
      'pic': 'https://picsum.photos/300/30',
      'message': 'I love to code',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://www.adeleyeayodeji.com/img/IMG_20200522_121756_834_2.jpg',
      'message': 'Very cool',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Tunde Martins',
      'pic': 'assets/img/userpic.jpg',
      'message': 'Very cool',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool',
      'date': '2021-01-01 12:00:00'
    },
  ];

  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Colors.blue,
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.amber,
                    // backgroundImage: CommentBox.commentImageParser(
                    //     imageURLorPath: data[i]['pic'])),
                  ),
                ),
              ),
              title: Text(
                data[i]['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['message']),
              trailing: Text(data[i]['date'], style: TextStyle(fontSize: 10)),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Future<bool> addComment() async {
    //   Map<String, dynamic> blogdata = {'commentText': commentController.text};
    //   try {
    //     final response = await http.post(Uri.parse(baseurl + 'comment'),
    //         body: blogdata, headers: {'Authorization': 'Bearer $token'});
    //     var data = jsonDecode(response.body) as Map;
    //     print(data);
    //     return data['success'];
    //   } catch (e) {
    //     print(e);
    //   }
    //   return false;
    // }

    return Scaffold(
      body: Container(
        child: CommentBox(
            userImage: CommentBox.commentImageParser(
                imageURLorPath: "assets/img/userpic.jpg"),
            child: commentChild(filedata),
            labelText: 'Write a comment...',
            errorText: 'Comment cannot be blank',
            withBorder: false,
            sendButtonMethod: () {
              if (formKey.currentState.validate()) {
                print(commentController.text);
                setState(() {
                  var value = {
                    'name': 'New User',
                    'pic':
                        'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
                    'message': commentController.text,
                    'date': '2021-01-01 12:00:00'
                  };
                  filedata.insert(0, value);
                });
                commentController.clear();
                FocusScope.of(context).unfocus();
              } else {
                print("Not validated");
              }
            },
            formKey: formKey,
            commentController: commentController,
            // backgroundColor: Color.fromARGB(255, 10, 9, 9),
            textColor: Colors.black,
            sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.black)),
      ),
    );
  }
}
