import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:product_listing/models/Product.dart';
import 'package:product_listing/services/api_service.dart';
import 'package:product_listing/widgets/product_details_screen.dart';

class ProductListScreen extends StatefulWidget {

  @override
  _ProductListStateScreen createState() => _ProductListStateScreen();
}
class _ProductListStateScreen extends State<ProductListScreen> {
  final ScrollController _scrollController = ScrollController();
  final ApiService _apiService = ApiService();
  final int _initialLimit = 20;
  final int _loadMoreLimit = 10;
  List<Product> _products = [];


  @override
  void initState(){
    super.initState();
    _scrollController.addListener(() {
      _scrollListener();
    });
    _loadInitialProducts();
  }

  void _scrollListener() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _loadMoreProducts();
    }
  }

  Future<void> _loadInitialProducts() async {
    final List<Product> moreProducts = await _apiService.getProducts(skip: 0, limit: _initialLimit);

    setState(() {
      _products.addAll(moreProducts);
      print(_products.length);
    });
  }

  Future<void> _loadMoreProducts() async {

    final int currentCount = _products.length;
    final List<Product> moreProducts = await _apiService.getProducts(skip: currentCount, limit: _loadMoreLimit);

    setState(() {
      _products.addAll(moreProducts);
      print(_products.length);
    });
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   _scrollController.removeListener(() {
  //     _scrollListener();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: FutureBuilder<void>(
        //future: _loadInitialProducts(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error loading products'),
            );
          } else {
            return ListView.builder(
              controller: _scrollController,
              itemCount: _products.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                final Product product = _products[index];
                return ListTile(
                  title: Text(product.title),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsScreen(product),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
