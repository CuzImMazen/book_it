import 'package:book_it/core/extensions/localization_extension.dart';
import 'package:flutter/material.dart';

class RangeSliderContainer extends StatelessWidget {
  final String text;
  final double min;
  final double max;
  final String unit;
  final int divisions;
  final RangeValues currentRange;
  final Function(RangeValues) onChanged;

  const RangeSliderContainer({
    super.key,
    required this.text,
    required this.min,
    required this.max,
    required this.divisions,
    this.unit = '',
    required this.currentRange,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.withAlpha(15),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          RangeSlider(
            min: min,
            max: max,
            divisions: divisions,
            values: currentRange,
            labels: RangeLabels(
              "${currentRange.start.toInt()} $unit",
              "${currentRange.end.toInt()} $unit",
            ),
            onChanged: onChanged,
          ),
          Text(
            "${context.home.min}: ${currentRange.start.toInt()} $unit - ${context.home.max}: ${currentRange.end.toInt()} $unit",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
