import 'dart:math';

import 'package:flutter/material.dart';

class Bacteria {
  double x;
  double y;
  // double rotation;
  final double height = 24;
  final double width = 12;

  Bacteria(this.x, this.y);

  factory Bacteria.createRandomFromBounds(double width, double height){
    final double x = Random().nextDouble() * width;
    final double y = Random().nextDouble() * height;

    return Bacteria(x, y);
  }

  factory Bacteria.createRandomFromExistingBacteria(Size environmentSize, Bacteria existingBacteria){
    double newX = existingBacteria.x + existingBacteria._getMovementAddition();
    double newY = existingBacteria.y + existingBacteria._getMovementAddition();

    if (newX < -existingBacteria.width){
      newX = environmentSize.width;
    } else if (newX > environmentSize.width + existingBacteria.width){
      newX = 0;
    }

    if (newY < -existingBacteria.height) {
      newY = environmentSize.height;
    } else if (newY > environmentSize.height + existingBacteria.height) {
      newY = 0;
    }

    final double x = newX;
    final double y = newY;

    return Bacteria(x, y);
  }

  double _getMovementAddition(){
    final double movementMax = width/6;
    return Random().nextDouble() * movementMax - movementMax/2;
  }
}