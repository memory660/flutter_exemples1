import 'package:flutter/material.dart';
import 'package:flutter_exemple1/ContainerImage.dart';
import 'package:flutter_exemple1/ParentChildState.dart';
import 'package:flutter_exemple1/counter.dart';
import 'package:flutter_exemple1/shoppingList.dart';

void main() {
  runApp(Nav2App());
}

class Nav2App extends StatelessWidget {
  final List<Product> products = [
    Product(name: 'Eggs'),
    Product(name: 'Flour'),
    Product(name: 'Chocolate chips'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      '/': (context) => ParentChildState(),
      '/exemple1': (context) => ShoppingList(products: products),
      '/exemple2': (context) => Counter(),
      '/exemple3': (context) => ContainerImage(),
      '/exemple4': (context) => ParentChildState()
    });
  }
}
