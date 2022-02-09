import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PreferIntakeViewModel extends BaseViewModel {
  final List<String> _prefIntakes = [
    'Carbs = 6-7',
    'Proteins = 2-3',
    'Fruits = 2-3',
    'Dairy = 2-3',
    'Fats = 1',
    'Vegies = as per needed',
  ];
  List<String> get prefIntakes => _prefIntakes;

  final List<String> _prefIntakesImages = [
    'assets/images/bottomBar/carb.png',
    'assets/images/bottomBar/fish.png',
    'assets/images/bottomBar/orange.png',
    'assets/images/bottomBar/glass.png',
    'assets/images/bottomBar/fat.png',
    'assets/images/bottomBar/veg.png',
  ];
  List<String> get prefIntakesImages => _prefIntakesImages;

  final List<Color> _prefIntakesColors = [
    const Color(0xFF84A94F),
    const Color(0xFFBFBBB6),
    const Color(0xFFF3B65A),
    const Color(0xFF55C2F1),
    const Color(0xFFED8B88),
    const Color(0xFFB7DB71),
  ];
  List<Color> get prefIntakesColors => _prefIntakesColors;
}
