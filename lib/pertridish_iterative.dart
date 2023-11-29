import 'dart:async';

import 'package:bacteria_growth/bacteria.dart';
import 'package:bacteria_growth/bacteria_collection.dart';
import 'package:flutter/material.dart';

class PetriDishIterative extends StatefulWidget {
  const PetriDishIterative({super.key});

  @override
  State<PetriDishIterative> createState() => _PetriDishIterativeState();
}

class _PetriDishIterativeState extends State<PetriDishIterative> {
  static const int tickTime = 30;
  static const double recreationProbability = 0.005;
  static const double deathProbability = 0.001;
  static const double maxBacteriaAmount = 1024;

  List<Bacteria> bacteriaList = <Bacteria>[Bacteria(30, 40), Bacteria(300, 400),Bacteria(100, 200),];

  Timer? timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(milliseconds: tickTime), (timer) {
      _tick();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void _tick(){
    if (bacteriaList.isEmpty){
      _createInitialBacteria();
      return;
    }
    _iterateAllBacteria();
  }

  void _createInitialBacteria(){
    // TODO: Implement
  }

  void _iterateAllBacteria(){
    final List<Bacteria> newList = <Bacteria>[];
    for (final Bacteria bacteria in bacteriaList){
      _createNewBacteria(bacteria, newList);
    }
    _updateBacteriaList(newList);
  }

  void _createNewBacteria(Bacteria bacteria,List<Bacteria> newList){
    // TODO: Implement
  }

  void _updateBacteriaList(List<Bacteria> newList){
    setState(() {
      bacteriaList = newList;
    });
  }






  @override
  Widget build(BuildContext context) {
    return BacteriaCollection(bacteriaList: bacteriaList);
  }
}
