import 'dart:math';

import 'package:areyousure/data/wisdom.dart';
import 'package:areyousure/models/message.dart';
import 'package:flutter/material.dart';

class ChatWisdomScreen extends StatefulWidget {
  const ChatWisdomScreen({super.key});

  @override
  State<ChatWisdomScreen> createState() => _ChatWisdomScreenState();
}

class _ChatWisdomScreenState extends State<ChatWisdomScreen>
    with SingleTickerProviderStateMixin {
  final List<Message> _messages = [];
  late WisdomGenerator _wisdomGenerator;
  final ScrollController _scrollController = ScrollController();
  bool _isDarkMode = true;
  bool _isTyping = false;
  String _pendingType = 'QUESTION';

  @override
  void initState() {
    super.initState();
    _wisdomGenerator = WisdomGenerator();
  }

  Future<void> _addQuestion(String type) async {
    setState(() {
      _isTyping = true;
      _pendingType = type;
    });

    await Future.delayed(const Duration(seconds: 2));

    final question = type == 'TRUTH'
        ? _wisdomGenerator.generateTruth()
        : _wisdomGenerator.generateDare();

    setState(() {
      _messages.add(Message(text: question, isUser: false));
      _isTyping = false;
    });

    await Future.delayed(const Duration(milliseconds: 100));
    if (!_scrollController.hasClients) return;
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'TRUTH OR DARE',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
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
                  activeColor: Colors.redAccent,
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
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDarkMode ? Colors.grey[900] : Colors.white,
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: _isTyping ? null : () => _addQuestion('TRUTH'),
                icon: const Icon(Icons.visibility),
                label: const Text('TRUTH'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: _isTyping ? null : () => _addQuestion('DARE'),
                icon: const Icon(Icons.whatshot),
                label: const Text('DARE'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
                child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.only(bottom: 16, top: 4),
                  itemCount: _messages.length + (_isTyping ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (_isTyping && index == _messages.length) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: TypingIndicator(label: _pendingType),
                      );
                    }
                    return BounceMessage(message: _messages[index]);
                  },
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
                  color: Colors.redAccent,
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
  const TypingIndicator({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$label...',
          style: const TextStyle(
            color: Colors.redAccent,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _dot(),
            const SizedBox(width: 4),
            _dot(),
            const SizedBox(width: 4),
            _dot(),
          ],
        ),
      ],
    );
  }

  Widget _dot() {
    return const CircleAvatar(
      radius: 4,
      backgroundColor: Colors.redAccent,
    );
  }
}
