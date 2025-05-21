import 'dart:math';

import 'package:flutter/material.dart';
import 'package:areyousure/data/jokes.dart';
import 'package:areyousure/models/message.dart';

class ChatJokeScreen extends StatefulWidget {
  const ChatJokeScreen({super.key});

  @override
  State<ChatJokeScreen> createState() => _ChatJokeScreenState();
}

class _ChatJokeScreenState extends State<ChatJokeScreen> with SingleTickerProviderStateMixin {
  final List<Message> _messages = [];
  String _currentLevel = 'dad';
  final List<String> _jokeLevels = ['dad', 'knock-knock', 'one-liner', 'dark'];
  late JokeGenerator _jokeGenerator;
  final ScrollController _scrollController = ScrollController();
  bool _isDarkMode = true;
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    _jokeGenerator = JokeGenerator();
  }

  void _addJoke() async {
    setState(() {
      _isTyping = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    final joke = _jokeGenerator.generateJoke(level: _currentLevel);

    setState(() {
      _messages.add(Message(
        text: joke,
        isUser: false,
        level: _currentLevel,
      ));
      _isTyping = false;
    });

    await Future.delayed(const Duration(milliseconds: 100));
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
    );
  }

  void _changeJokeLevel(String? newLevel) {
    if (newLevel != null) {
      setState(() {
        _currentLevel = newLevel;
        _messages.add(Message(
          text: "Joke style set to: ${newLevel.toUpperCase()}",
          isUser: false,
          level: newLevel,
          isSystem: true,
        ));
      });

      Future.delayed(const Duration(milliseconds: 100), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOut,
        );
      });
    }
  }

  Color _getLevelColor(String level) {
    switch (level) {
      case 'dad':
        return Colors.orange;
      case 'knock-knock':
        return Colors.green;
      case 'one-liner':
        return Colors.blue;
      case 'dark':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ARE YOU SURE',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orangeAccent,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
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
                      activeColor: Colors.orangeAccent,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    Icon(Icons.dark_mode, color: Colors.grey[400], size: 16),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'STYLE: ${_currentLevel.toUpperCase()}',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    LinearProgressIndicator(
                      value: (_jokeLevels.indexOf(_currentLevel) + 1) / _jokeLevels.length,
                      backgroundColor: Colors.grey[800],
                      color: _getLevelColor(_currentLevel),
                      minHeight: 4,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: _currentLevel,
                  dropdownColor: Colors.grey[850],
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.white, size: 16),
                  style: TextStyle(
                    color: _getLevelColor(_currentLevel),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  items: _jokeLevels.map((level) {
                    return DropdownMenuItem<String>(
                      value: level,
                      child: Text(
                        level.toUpperCase(),
                        style: TextStyle(
                          color: _getLevelColor(level),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: _changeJokeLevel,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDarkMode ? Colors.grey[900] : Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addJoke,
        label: const Text('TELL ME A JOKE'),
        icon: const Icon(Icons.emoji_emotions),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        elevation: 10,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
                  padding: const EdgeInsets.only(bottom: 100, top: 4),
                  itemCount: _messages.length + (_isTyping ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (_isTyping && index == _messages.length) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: TypingIndicator(),
                      );
                    }
                    final message = _messages[index];
                    return BounceMessage(
                      message: message,
                      level: message.level ?? '',
                    );
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
  final String level;

  const BounceMessage({
    super.key,
    required this.message,
    required this.level,
  });

  @override
  State<BounceMessage> createState() => _BounceMessageState();
}

class _BounceMessageState extends State<BounceMessage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bounceAnimation;
  double? _tiltAngle;

  Color _getBackgroundColor(String level) {
    switch (level) {
      case 'dad':
        return Colors.orange.withOpacity(0.85);
      case 'knock-knock':
        return Colors.green.withOpacity(0.85);
      case 'one-liner':
        return Colors.blue.withOpacity(0.9);
      case 'dark':
        return Colors.purple[700]!.withOpacity(0.9);
      default:
        return Colors.grey;
    }
  }

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
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = _getBackgroundColor(widget.level);

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
                  color: bgColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                child: Text(
                  widget.message.text,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontFamily: 'ComicSans',
                    letterSpacing: 0.5,
                    height: 1.3,
                    shadows: [
                      Shadow(
                        blurRadius: 2,
                        color: Colors.black26,
                        offset: Offset(1, 1),
                      )
                    ],
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
        _dot(delay: 200),
        const SizedBox(width: 4),
        _dot(delay: 400),
      ],
    );
  }

  Widget _dot({int delay = 0}) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      builder: (context, value, child) => Opacity(
        opacity: value,
        child: child,
      ),
      onEnd: () {},
      child: const CircleAvatar(
        radius: 4,
        backgroundColor: Colors.orange,
      ),
    );
  }
}