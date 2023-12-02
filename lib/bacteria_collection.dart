import 'package:bacteria_growth/bacteria.dart';
import 'package:bacteria_growth/bacteria_collection_painter.dart';
import 'package:flutter/material.dart';

class BacteriaCollection extends StatelessWidget {
  const BacteriaCollection({super.key, required this.bacteriaList});

  final List<Bacteria> bacteriaList;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BacteriaCollectionPainter(bacteriaList: bacteriaList),
    );
  }
}
