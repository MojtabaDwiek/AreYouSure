import 'dart:math' as math;

import 'package:flutter/material.dart';

class PullQuestionDeck extends StatefulWidget {
  const PullQuestionDeck({
    super.key,
    required this.accentColor,
    required this.label,
    required this.icon,
    required this.onRevealQuestion,
    this.modeHint,
  });

  final Color accentColor;
  final String label;
  final IconData icon;
  final Future<String> Function() onRevealQuestion;
  final String? modeHint;

  @override
  State<PullQuestionDeck> createState() => _PullQuestionDeckState();
}

class _PullQuestionDeckState extends State<PullQuestionDeck>
    with SingleTickerProviderStateMixin {
  static const double _liftDistance = 75;
  static const Duration _flipDuration = Duration(milliseconds: 430);

  late AnimationController _controller;
  Animation<double>? _progressAnimation;
  double _progress = 0;
  bool _isFlipped = false;
  String? _question;
  bool _isAnimating = false;

  bool get _locked => _isAnimating;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addListener(() {
      final anim = _progressAnimation;
      if (anim == null) return;
      setState(() {
        _progress = anim.value;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _animateTo(
    double target, {
    required Duration duration,
    Curve curve = Curves.easeOut,
  }) async {
    _controller.stop();
    _controller.duration = duration;
    _progressAnimation = Tween<double>(begin: _progress, end: target).animate(
      CurvedAnimation(parent: _controller, curve: curve),
    );
    await _controller.forward(from: 0);
  }

  Future<void> _completeReveal() async {
    if (_locked) return;

    setState(() {
      _isAnimating = true;
    });

    if (_isFlipped) {
      setState(() {
        _isFlipped = false;
        _question = null;
      });
      await Future.delayed(_flipDuration);
      if (!mounted) return;
    }

    final questionFuture = widget.onRevealQuestion();

    await _animateTo(
      1,
      duration: const Duration(milliseconds: 130),
      curve: Curves.easeOutCubic,
    );

    final question = await questionFuture;
    if (!mounted) return;

    setState(() {
      _question = null;
      _isFlipped = true;
    });

    await Future.delayed(_flipDuration);
    if (!mounted) return;

    setState(() {
      _question = question;
    });

    await _animateTo(
      0,
      duration: const Duration(milliseconds: 170),
      curve: Curves.easeInOutCubic,
    );
    if (!mounted) return;

    setState(() {
      _isAnimating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final hintColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white70
        : Colors.black54;
    final yOffset = -_progress * _liftDistance;
    final rotateX = _progress * 0.20;
    final scale = 1 + (_progress * 0.015);

    return Center(
      child: SizedBox(
        width: 290,
        height: 460,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Transform.translate(
                    offset: const Offset(0, 24),
                    child: _DeckCardBase(
                      color: widget.accentColor.withOpacity(0.30),
                      label: '',
                      icon: widget.icon,
                      showContent: false,
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(0, 12),
                    child: _DeckCardBase(
                      color: widget.accentColor.withOpacity(0.50),
                      label: '',
                      icon: widget.icon,
                      showContent: false,
                    ),
                  ),
                  GestureDetector(
                    onTap: _locked ? null : _completeReveal,
                    child: Transform(
                      alignment: Alignment.bottomCenter,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.0016)
                        ..translate(0.0, yOffset, 0.0)
                        ..rotateX(rotateX)
                        ..scale(scale),
                      child: TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0, end: _isFlipped ? 1 : 0),
                        duration: _flipDuration,
                        curve: Curves.easeInOut,
                        builder: (context, value, child) {
                          final angle = value * math.pi;
                          final showBack = angle <= (math.pi / 2);
                          return Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.002)
                              ..rotateY(angle),
                            child: showBack
                                ? _DeckCardFace(
                                    color: widget.accentColor,
                                    label: widget.label,
                                    icon: widget.icon,
                                    isFront: false,
                                    question: _question,
                                  )
                                : Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.identity()..rotateY(math.pi),
                                    child: _DeckCardFace(
                                      color: widget.accentColor,
                                      label: widget.label,
                                      icon: widget.icon,
                                      isFront: true,
                                      question: _question,
                                    ),
                                  ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            
            if (widget.modeHint != null) ...[
              const SizedBox(height: 6),
              Text(
                widget.modeHint!,
                style: TextStyle(color: hintColor, fontWeight: FontWeight.w600),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _DeckCardFace extends StatelessWidget {
  const _DeckCardFace({
    required this.color,
    required this.label,
    required this.icon,
    required this.isFront,
    required this.question,
  });

  final Color color;
  final String label;
  final IconData icon;
  final bool isFront;
  final String? question;

  @override
  Widget build(BuildContext context) {
    return _DeckCardBase(
      color: color,
      label: label,
      icon: icon,
      showContent: true,
      showCenterMark: !isFront,
      child: isFront
          ? Padding(
              padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
              child: Center(
                child: Text(
                  question ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    height: 1.35,
                    fontSize: 20,
                  ),
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  
                ),
              ),
            ),
    );
  }
}

class _DeckCardBase extends StatelessWidget {
  const _DeckCardBase({
    required this.color,
    required this.label,
    required this.icon,
    required this.showContent,
    this.showCenterMark = true,
    this.child,
  });

  final Color color;
  final String label;
  final IconData icon;
  final bool showContent;
  final bool showCenterMark;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      height: 360,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [color.withOpacity(0.95), color.withOpacity(0.85)],
        ),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: Colors.white.withOpacity(0.25), width: 1.1),
        boxShadow: const [
          BoxShadow(color: Colors.black38, blurRadius: 14, offset: Offset(0, 8)),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: -18,
            left: -18,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.13),
              ),
            ),
          ),
          Positioned(
            bottom: -28,
            right: -18,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(0.12),
              ),
            ),
          ),
          if (showContent && child != null) child!,
          if (showContent)
            Positioned(
              right: 12,
              top: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.35),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: Colors.white24),
                ),
                child: const Text(
                  'SHU R2YK',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 10,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
            ),
          if (showContent)
            Positioned(left: 14, top: 12, child: Icon(icon, color: Colors.white, size: 20)),
          if (showContent)
            Positioned(
              left: 14,
              bottom: 12,
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.1,
                  fontSize: 11,
                ),
              ),
            ),
          if (showContent)
            Positioned(
              right: 14,
              bottom: 12,
              child: Transform.rotate(
                angle: math.pi,
                child: Icon(icon, color: Colors.white, size: 18),
              ),
            ),
          if (!showContent)
            Center(child: Icon(icon, color: Colors.white.withOpacity(0.65), size: 34)),
          if (showContent && showCenterMark)
            Center(
              child: Container(
                width: 112,
                height: 112,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.13),
                ),
                child: const Icon(
                  Icons.question_mark_rounded,
                  color: Colors.white,
                  size: 62,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
