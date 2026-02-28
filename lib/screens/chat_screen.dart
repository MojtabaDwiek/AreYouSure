import 'dart:math';

import 'package:areyousure/data/insults.dart';
import 'package:areyousure/models/message.dart';
import 'package:areyousure/widgets/pull_question_deck.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with SingleTickerProviderStateMixin {
  late HybridInsultGenerator _insultGenerator;
  bool _isDarkMode = true;

  @override
  void initState() {
    super.initState();
    _insultGenerator = HybridInsultGenerator();
  }

  Future<String> _addQuestion() async {
    return _insultGenerator.generateInsult();
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'DO YOU KNOW ME',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.cyan,
              letterSpacing: 1.1,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.light_mode, color: Colors.grey[400], size: 16),
                Switch(
                  value: _isDarkMode,
                  onChanged: (val) => setState(() => _isDarkMode = val),
                  activeColor: Colors.cyan,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                Icon(Icons.dark_mode, color: Colors.grey[400], size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDarkMode ? Colors.grey[900] : Colors.white,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: _isDarkMode
                  ? [Colors.grey[900]!, Colors.black, Colors.grey[900]!]
                  : [Colors.grey[200]!, Colors.white, Colors.grey[200]!],
              stops: const [0.0, 0.3, 1.0],
            ),
          ),
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: PullQuestionDeck(
                  accentColor: Colors.cyan,
                  label: 'DO YOU KNOW ME',
                  icon: Icons.style,
                  onRevealQuestion: _addQuestion,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BounceMessage extends StatefulWidget {
  final Message message;

  const BounceMessage({
    super.key,
    required this.message,
  });

  @override
  State<BounceMessage> createState() => _BounceMessageState();
}

class _BounceMessageState extends State<BounceMessage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bounceAnimation;
  double? _tiltAngle;

  double _generateRandomTilt() {
    final random = Random();
    return (random.nextDouble() * 0.08) - 0.04;
  }

  @override
  void initState() {
    super.initState();
    _tiltAngle = _generateRandomTilt();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );

    _bounceAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.2), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.2, end: 0.9), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 0.9, end: 1.0), weight: 30),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _bounceAnimation,
      builder: (context, child) {
        return Center(
          child: Transform.rotate(
            angle: _tiltAngle ?? 0.0,
            child: Transform.scale(
              scale: _bounceAnimation.value,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.8,
                ),
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 6,
                      offset: Offset(2, 4),
                    ),
                  ],
                ),
                child: Text(
                  widget.message.text,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: 0.5,
                    height: 1.3,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class TypingIndicator extends StatelessWidget {
  const TypingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _dot(),
        const SizedBox(width: 4),
        _dot(),
        const SizedBox(width: 4),
        _dot(),
      ],
    );
  }

  Widget _dot() {
    return const CircleAvatar(
      radius: 4,
      backgroundColor: Colors.cyan,
    );
  }
}
