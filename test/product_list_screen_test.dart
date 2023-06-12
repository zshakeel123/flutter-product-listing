
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:product_listing/widgets/product_list_screen.dart';

void main() {
  testWidgets('Product List Screen Test', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(MaterialApp(home: ProductListScreen()));

    // Verify that the loading indicator is displayed
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Wait for the initial products to load
    await tester.pumpAndSettle();

    // Verify that the product list is displayed
    expect(find.byType(ListView), findsOneWidget);

    // Scroll to the end of the list
    //await tester.drag(find.byType(ListView), Offset(0, -2000));
    //await tester.pumpAndSettle();

    // Verify that more products are loaded
    //expect(find.byType(ListTile), findsNWidgets(_initialLimit! + _loadMoreLimit));
  });
}