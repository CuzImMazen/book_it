import 'package:flutter/material.dart';
import 'stepper_tile.dart';

class RoomSelector extends StatelessWidget {
  const RoomSelector({
    super.key,
    required this.bedrooms,
    required this.bathrooms,
    required this.kitchens,
    required this.onBedroomsChanged,
    required this.onBathroomsChanged,
    required this.onKitchensChanged,
  });

  final int bedrooms;
  final int bathrooms;
  final int kitchens;

  final ValueChanged<int> onBedroomsChanged;
  final ValueChanged<int> onBathroomsChanged;
  final ValueChanged<int> onKitchensChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: scheme.onSurface.withAlpha(40)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          StepperTile(
            title: "Bedrooms",
            icon: Icons.king_bed_outlined,
            value: bedrooms,
            onChanged: onBedroomsChanged,
          ),
          _divider(context),
          StepperTile(
            title: "Bathrooms",
            icon: Icons.hot_tub_outlined,
            value: bathrooms,
            onChanged: onBathroomsChanged,
          ),
          _divider(context),
          StepperTile(
            title: "Kitchens",
            icon: Icons.flatware_rounded,
            value: kitchens,
            onChanged: onKitchensChanged,
          ),
        ],
      ),
    );
  }

  Widget _divider(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Divider(
      color: scheme.onSurface.withAlpha(30),
      indent: 50,
      endIndent: 20,
      height: 16,
    );
  }
}
