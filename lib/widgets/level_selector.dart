import 'package:flutter/material.dart';

class LevelSelector extends StatelessWidget {
  final String currentLevel;
  final ValueChanged<String> onLevelChanged;

  const LevelSelector({
    super.key,
    required this.currentLevel,
    required this.onLevelChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<String>(
      segments: const [
        ButtonSegment(value: 'mild', label: Text('Mild')),
        ButtonSegment(value: 'medium', label: Text('Medium')),
        ButtonSegment(value: 'nuclear', label: Text('Nuclear')),
      ],
      selected: {currentLevel},
      onSelectionChanged: (Set<String> newSelection) {
        onLevelChanged(newSelection.first);
      },
      style: ButtonStyle(
        visualDensity: VisualDensity.compact,
      ),
    );
  }
}