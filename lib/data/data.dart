import 'package:flutter/material.dart';

class Category {
  final String name;
  final List<Product>? products;
  const Category({
    required this.name,
    this.products,
  });
}

class Product {
  final String name;
  final String image;
  final String price;
  final bool isSelected;
  final Color color;
  final Color nutrientsColor;
  final List<List<String>> nutrients;

  const Product({
    required this.name,
    required this.price,
    required this.image,
    required this.nutrientsColor,
    required this.color,
    required this.isSelected,
    required this.nutrients,
  });
}

final data = [
  Category(
    name: "Frutas",
    products: [
      Product(
        name: "Maçã",
        price: "4.80",
        nutrientsColor: Colors.red,
        image: "assets/fruits/apple.png",
        isSelected: true,
        color: Colors.red.shade50,
        nutrients: [
          ['Energia', '3'],
          ['Frescor', '2'],
          ['Vitaminas', '4'],
          ['Calorias', '1'],
        ],
      ),
      Product(
        name: "Limão",
        price: "2.55",
        image: "assets/fruits/lemon.png",
        isSelected: false,
        nutrientsColor: Colors.green,
        color: Colors.yellow.shade50,
        nutrients: [
          ['Energia', '2'],
          ['Frescor', '3'],
          ['Vitaminas', '2'],
          ['Calorias', '3'],
        ],
      ),
      Product(
        name: "Abacate",
        price: "8.99",
        image: "assets/fruits/avocado.png",
        isSelected: false,
        nutrientsColor: Colors.orange,
        color: Colors.lightGreen.shade50,
        nutrients: [
          ['Energia', '4'],
          ['Frescor', '2'],
          ['Vitaminas', '2'],
          ['Calorias', '4'],
        ],
      ),
      Product(
        name: "Uva",
        price: "4.15",
        image: "assets/fruits/grapes.png",
        isSelected: true,
        nutrientsColor: Colors.yellow,
        color: Colors.purple.shade50,
        nutrients: [
          ['Energia', '2'],
          ['Frescor', '1'],
          ['Vitaminas', '2'],
          ['Calorias', '3'],
        ],
      ),
    ],
  ),
  const Category(name: "Vegetais"),
  const Category(name: "Diário"),
  const Category(name: "Grãos"),
  const Category(name: "Carnes"),
];
