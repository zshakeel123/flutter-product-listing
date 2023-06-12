import 'package:flutter/material.dart';
import 'package:product_listing/models/Product.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  ProductDetailsScreen(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                image: product.thumbnail != null
                    ? DecorationImage(
                  image: NetworkImage(product.thumbnail!),
                  fit: BoxFit.cover,
                )
                    : DecorationImage(
                  image: AssetImage('assets/sample-thumbnail.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            // Product Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                product.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            // Product Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                product.description ?? '',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 8),
            //Product ID
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Product ID: " + product.id.toString(),
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 8),
            // Product Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Price: \$${product.price ?? 0}',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 8),
            // Product Rating
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Rating: ${product.rating ?? 0}',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 8),
            // Product Brand
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Brand: ${product.brand ?? ''}',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 8),
            // Product Category
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Category: ${product.category ?? ''}',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
