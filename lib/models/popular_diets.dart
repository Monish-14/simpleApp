import 'package:flutter/material.dart';

class PopularDietsModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool boxIsSelected;
  Color boxColor;

  PopularDietsModel({
    required this.name,
    required this.boxIsSelected,
    required this.calorie,
    required this.duration,
    required this.iconPath,
    required this.level,
    required this.boxColor,
  });

  static List<PopularDietsModel> getPopularDiets() {
    List<PopularDietsModel> popularDiets = [];

    popularDiets.add(PopularDietsModel(
        name: ' Blueberry PanCake',
        boxIsSelected: true,
        calorie: '230kcal',
        duration: '30 mins',
        iconPath: 'assets/icons/salad.png',
        level: 'Easy',
        boxColor: const Color(0xffC58BF2).withOpacity(0.3)));
    popularDiets.add(PopularDietsModel(
        name: 'Salmon Nigiri',
        boxIsSelected: true,
        calorie: '120kcal',
        duration: '20 mins',
        iconPath: 'assets/icons/pie.png',
        level: 'Easy',
        boxColor: const Color(0xff92A3FD).withOpacity(0.3)));
    return popularDiets;
  }
}
