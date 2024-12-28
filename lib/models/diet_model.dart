import 'package:flutter/material.dart';

class DietModel {
  String name;
  String iconPath;
  Color boxColor;
  String level;
  String duration;
  String calorie;
  bool viewIsSelection;

  DietModel(
      {required this.name,
      required this.iconPath,
      required this.boxColor,
      required this.level,
      required this.duration,
      required this.calorie,
      required this.viewIsSelection});

  static List<DietModel> getDiets() {
    List<DietModel> diets = [];

    diets.add(DietModel(
        name: 'salat',
        iconPath: 'assets/icons/filter-solid.svg',
        boxColor: const Color.fromARGB(255, 37, 120, 189),
        level: 'easy',
        duration: '30min',
        calorie: '180kcal',
        viewIsSelection: true));

    diets.add(DietModel(
        name: 'salat',
        iconPath: 'assets/icons/filter-solid.svg',
        boxColor: const Color.fromARGB(255, 40, 161, 33),
        level: 'easy',
        duration: '30min',
        calorie: '180kcal',
        viewIsSelection: true));

    diets.add(DietModel(
        name: 'salat',
        iconPath: 'assets/icons/filter-solid.svg',
        boxColor: const Color.fromARGB(255, 189, 37, 118),
        level: 'easy',
        duration: '30min',
        calorie: '180kcal',
        viewIsSelection: true));

    diets.add(DietModel(
        name: 'salat',
        iconPath: 'assets/icons/filter-solid.svg',
        boxColor: const Color.fromARGB(255, 37, 120, 189),
        level: 'easy',
        duration: '30min',
        calorie: '180kcal',
        viewIsSelection: true));

    return diets;
  }
}
