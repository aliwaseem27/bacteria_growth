import 'dart:async';
import 'dart:math';

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

  List<Bacteria> bacteriaList = <Bacteria>[];

  Timer? timer;
  Size size = Size.zero;

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

  void _tick() {
    if (bacteriaList.isEmpty) {
      _createInitialBacteria();
      return;
    }
    _iterateAllBacteria();
  }

  void _createInitialBacteria() {
    final List<Bacteria> newList = <Bacteria>[];
    newList.add(Bacteria.createRandomFromBounds(size.width, size.height));
    _updateBacteriaList(newList);
  }

  void _iterateAllBacteria() {
    final List<Bacteria> newList = <Bacteria>[];

    for (final Bacteria bacteria in bacteriaList) {
      final bool shouldKill = Random().nextDouble() > 1 - deathProbability;

      if (!shouldKill){
        final Bacteria movedBacteria = Bacteria.createRandomFromExistingBacteria(size, bacteria);
        newList.add(movedBacteria);
      }
      _createNewBacteria(bacteria, newList);
    }
    _updateBacteriaList(newList);
  }

  void _createNewBacteria(Bacteria bacteria, List<Bacteria> newList) {
    final bool shouldCreateNew =
        Random().nextDouble() > 1 - recreationProbability;

    if (shouldCreateNew && bacteriaList.length < maxBacteriaAmount) {
      newList.add(Bacteria.createRandomFromExistingBacteria(size, bacteria));
    }
  }

  void _updateBacteriaList(List<Bacteria> newList) {
    setState(() {
      bacteriaList = newList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      size = constraints.biggest;
      return SizedBox(
        width: size.width,
        height: size.height,
        child: BacteriaCollection(bacteriaList: bacteriaList),
      );
    });
  }
}
