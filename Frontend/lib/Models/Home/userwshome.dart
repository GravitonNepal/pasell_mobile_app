// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:pasell/Models/AuthModel.dart';

UserHome productsHomeFromJson(String str) =>
    UserHome.fromJson(json.decode(str));

String productsHomeToJson(UserHome data) => json.encode(data.tojson());

class UserHome {
  bool resp;
  String msj;
  List<Users> user;
  UserHome({
    this.resp,
    this.msj,
    this.user,
  });

  UserHome copyWith({
    bool resp,
    String msj,
    List<Users> user,
  }) {
    return UserHome(
      resp: resp ?? this.resp,
      msj: msj ?? this.msj,
      user: user ?? this.user,
    );
  }

  factory UserHome.fromJson(Map<String, dynamic> json) {
    return UserHome(
      resp: json['resp'] as bool,
      msj: json['msj'] as String,
      user: List<Users>.from(json["user"].map((x) {
        return Users.fromJson(x);
      })),
    );
  }

  Map<String, dynamic> tojson() {
    return <String, dynamic>{
      'resp': resp,
      'msj': msj,
      "products": List<dynamic>.from(user.map((x) => x.toJson())),
    };
  }

  //

  // @override
  // String toString() => 'UserHome(resp: $resp, msj: $msj, user: $user)';
}
