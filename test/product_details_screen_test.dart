import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:product_listing/models/Product.dart';
import 'package:product_listing/widgets/product_details_screen.dart';

void main() {
  testWidgets('ProductDetailScreen displays correct product details', (WidgetTester tester) async {
    // Create a mock product for testing
    final product = Product(
      id: 1,
      title: 'Sample Product',
      description: 'This is a sample product description.',
      price: 10,
      rating: 4.5,
      brand: 'Sample Brand',
      category: 'Sample Category',
      //thumbnail: 'assets/sample-thumbnail.jpg',
    );

    // Build the ProductDetailScreen widget
    await tester.pumpWidget(MaterialApp(
      home: ProductDetailsScreen(product),
    ));

    // Verify that the product details are displayed correctly
    expect(find.text('Sample Product'), findsOneWidget);
    expect(find.text('This is a sample product description.'), findsOneWidget);
    expect(find.text('Price: \$10'), findsOneWidget);
    expect(find.text('Rating: 4.5'), findsOneWidget);
    expect(find.text('Brand: Sample Brand'), findsOneWidget);
    expect(find.text('Category: Sample Category'), findsOneWidget);
  });
}
