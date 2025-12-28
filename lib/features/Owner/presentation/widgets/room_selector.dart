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
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF5F5F5)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 10,
            offset: Offset(0, 4),
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
          _divider(),
          StepperTile(
            title: "Bathrooms",
            icon: Icons.hot_tub_outlined,
            value: bathrooms,
            onChanged: onBathroomsChanged,
          ),
          _divider(),
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

  Widget _divider() =>
      const Divider(color: Color(0xFFFAFAFA), indent: 50, endIndent: 20);
}
