import 'package:pasell/Views/Categories/CategoryProductsPage.dart';
import 'package:pasell/Widgets/StaggeredDualView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CategoryProductPage ...', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: CategoryProductsPage(category: "Test", uidCategory: ""),
    ));

    final title = find.text('Test');
    expect(title, findsOneWidget);

    final staggeredDualView = find.byType(StaggeredDualView);
    expect(staggeredDualView, findsOneWidget);
  });
  testWidgets('Testing if Staggered Dual View Shows items ...', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: CategoryProductsPage(category: "Test", uidCategory: ""),
    ));

    final staggeredDualView = find.byType(StaggeredDualView);
    expect(staggeredDualView, findsOneWidget);

    final card = find.byType(Card);
    expect(card, findsNothing);
  });
}
