import 'package:flutter/material.dart';

class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  Color boxColor;
  bool viewIsSelected;

  DietModel({
    required this.boxColor,
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.viewIsSelected,
  });

  static List<DietModel> getDiets() {
    List<DietModel> diets = [];

    diets.add(DietModel(
      name: 'Honey Pancake',
      iconPath: 'assets/icons/pancake.png',
      level: 'Easy',
      duration: '30 mins',
      calorie: '180kcal',
      boxColor: const Color(0xff92A3FD),
      viewIsSelected: true,
    ));

    diets.add(DietModel(
      boxColor: const Color(0xffC58BF2),
      name: 'Canai Bread',
      iconPath: 'assets/icons/cbread.png',
      level: 'Medium',
      duration: '30 mins',
      calorie: '230kcal',
      viewIsSelected: true,
    ));

    return diets;
  }
}
