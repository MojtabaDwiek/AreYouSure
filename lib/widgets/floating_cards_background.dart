import 'dart:math' as math;

import 'package:flutter/material.dart';

class FloatingCardsBackground extends StatefulWidget {
  const FloatingCardsBackground({
    super.key,
    this.cardCount = 18,
    this.seed = 0,
  });

  final int cardCount;
  final int seed;

  @override
  State<FloatingCardsBackground> createState() => _FloatingCardsBackgroundState();
}

class _FloatingCardsBackgroundState extends State<FloatingCardsBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<_CardConfig> _cards;

  @override
  void initState() {
    super.initState();
    final random = math.Random(widget.seed);
    _cards = List.generate(widget.cardCount, (_) => _CardConfig.random(random));
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 14),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const palette = <Color>[
      Color(0xFFE53935),
      Color(0xFFFF7043),
      Color(0xFFFFCA28),
      Color(0xFF66BB6A),
      Color(0xFF26A69A),
      Color(0xFF29B6F6),
      Color(0xFF5C6BC0),
      Color(0xFFAB47BC),
      Color(0xFFEC407A),
    ];

    return IgnorePointer(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final t = _controller.value;
          return LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              final height = constraints.maxHeight;
              return Stack(
                children: _cards.asMap().entries.map((entry) {
                  final i = entry.key;
                  final c = entry.value;
                  final phase = ((t + c.phase) % 1.0) * 2 * math.pi;
                  final swing = math.sin(phase * c.speed) * c.swing;
                  final floatY = math.cos(phase * c.speed) * c.floatRange;
                  final normalizedX = (c.x + swing).clamp(0.0, 1.0).toDouble();
                  final normalizedY = (c.y + floatY).clamp(0.0, 1.0).toDouble();
                  final cardW = c.size * 0.7;
                  final cardH = c.size;
                  final left = normalizedX * (width - cardW);
                  final top = normalizedY * (height - cardH);
                  final color = palette[i % palette.length].withOpacity(0.16);
                  final angle = c.rotation + math.sin(phase) * 0.08;

                  return Positioned(
                    left: left,
                    top: top,
                    child: Transform.rotate(
                      angle: angle,
                      child: Container(
                        width: cardW,
                        height: cardH,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.white.withOpacity(0.06)),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          );
        },
      ),
    );
  }
}

class _CardConfig {
  const _CardConfig({
    required this.x,
    required this.y,
    required this.size,
    required this.phase,
    required this.speed,
    required this.floatRange,
    required this.swing,
    required this.rotation,
  });

  final double x;
  final double y;
  final double size;
  final double phase;
  final double speed;
  final double floatRange;
  final double swing;
  final double rotation;

  factory _CardConfig.random(math.Random random) {
    return _CardConfig(
      x: random.nextDouble(),
      y: random.nextDouble(),
      size: 14 + random.nextDouble() * 20,
      phase: random.nextDouble(),
      speed: 0.55 + random.nextDouble() * 0.55,
      floatRange: 0.008 + random.nextDouble() * 0.02,
      swing: 0.006 + random.nextDouble() * 0.025,
      rotation: (random.nextDouble() - 0.5) * 0.8,
    );
  }
}
