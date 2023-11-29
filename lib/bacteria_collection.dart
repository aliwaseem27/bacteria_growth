import 'package:bacteria_growth/bacteria.dart';
import 'package:flutter/material.dart';

class BacteriaCollection extends StatelessWidget {
  const BacteriaCollection({super.key, required this.bacteriaList});

  final List<Bacteria> bacteriaList;

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetList = bacteriaList
        .map((Bacteria bacteria) => _buildWidgetFromBacteria(bacteria))
        .toList();
    return Stack(
      children: widgetList,
    );
  }

  Positioned _buildWidgetFromBacteria(Bacteria bacteria) {
    return Positioned(
      left: bacteria.x,
      top: bacteria.y,
      child: Container(
        width: 10,
        height: 10,
        color: Colors.black,
      ),
    );
  }
}
