import 'package:flutter/material.dart';

class CategoryModels {
  String name;
  String iconpath;
  Color boxColor;

  CategoryModels({
    required this.name,
    required this.iconpath,
    required this.boxColor,
  });

  static List<CategoryModels> getCategories() {
    List<CategoryModels> categories = [];

    categories.add(CategoryModels(
        name: 'salat',
        iconpath: 'assets/icons/filter-solid.svg',
        boxColor: const Color.fromARGB(255, 37, 120, 189)));

    categories.add(CategoryModels(
        name: 'pizza',
        iconpath: 'assets/icons/filter-solid.svg',
        boxColor: const Color.fromARGB(255, 40, 161, 33)));

    categories.add(CategoryModels(
        name: 'phancake',
        iconpath: 'assets/icons/filter-solid.svg',
        boxColor: const Color.fromARGB(255, 189, 37, 118)));

    categories.add(CategoryModels(
        name: 'cake',
        iconpath: 'assets/icons/filter-solid.svg',
        boxColor: const Color.fromARGB(255, 121, 37, 189)));

    return categories;
  }
}
