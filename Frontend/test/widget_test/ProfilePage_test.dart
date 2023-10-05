import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pasell/Views/Profile/ProfilePage.dart';

void main() {
  testWidgets('ProfilePage ...', (tester) async {
    tester.pumpWidget(MaterialApp(
      home: Scaffold(body: ProfilePage()),
    ));

    find.byType(Stack);
  });
}
