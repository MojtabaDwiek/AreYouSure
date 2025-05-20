import 'dart:math';
import 'package:flutter/material.dart';
import 'package:areyousure/data/insults.dart';
import 'package:areyousure/models/message.dart';
import 'package:areyousure/widgets/insult_bubble.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with SingleTickerProviderStateMixin {
  final List<Message> _messages = [];
  String _currentLevel = 'mild';
  final List<String> _roastLevels = ['mild', 'medium', 'spicy', 'nuclear'];
  late HybridInsultGenerator _insultGenerator;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _insultGenerator = HybridInsultGenerator();
    
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    
    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutBack,
      ),
    );
    
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _addInsult() {
    final insult = _insultGenerator.generateInsult(level: _currentLevel);
    
    setState(() {
      _messages.add(Message(
        text: insult,
        isUser: false,
        level: _currentLevel,
      ));
    });
  }

  void _changeRoastLevel(String? newLevel) {
    if (newLevel != null) {
      setState(() {
        _currentLevel = newLevel;
        _messages.add(Message(
          text: "Roast level set to: ${newLevel.toUpperCase()}",
          isUser: false,
          level: newLevel,
          isSystem: true,
        ));
      });
      
      _animationController.reset();
      _animationController.forward();
    }
  }

  Color _getLevelColor(String level) {
    switch (level) {
      case 'mild': return Colors.green;
      case 'medium': return Colors.yellow;
      case 'spicy': return Colors.orange;
      case 'nuclear': return Colors.red;
      default: return Colors.amber;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        centerTitle: true,
        title: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '? ARE YOU SURE ?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      color: Colors.amber,
                      shadows: [
                        Shadow(
                          blurRadius: 10,
                          color: Colors.amber.withOpacity(0.7),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.amber.withOpacity(0.5),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: DropdownButton<String>(
                      value: _currentLevel,
                      dropdownColor: Colors.grey[900],
                      icon: Icon(Icons.arrow_drop_down, color: Colors.amber, size: 20),
                      underline: Container(),
                      style: TextStyle(
                        color: _getLevelColor(_currentLevel),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 5,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ],
                      ),
                      items: _roastLevels.map((String level) {
                        return DropdownMenuItem<String>(
                          value: level,
                          child: Text(
                            level.toUpperCase(),
                            style: TextStyle(
                              color: _getLevelColor(level),
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 5,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: _changeRoastLevel,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        backgroundColor: Colors.black,
        elevation: 10,
        shadowColor: Colors.amber.withOpacity(0.3),
        toolbarHeight: 100,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.grey[900]!,
                Colors.black,
                Colors.grey[900]!,
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.grey[900]!,
              Colors.black,
              Colors.grey[900]!,
            ],
            stops: const [0.0, 0.3, 1.0],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (_messages.isEmpty)
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'Press the button to get roasted!',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ..._messages.map((message) => BounceMessage(
                            message: message,
                            level: message.level ?? '',
                          )),
                      const SizedBox(height: 80), // Space for button
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: _addInsult,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 10,
                  shadowColor: Colors.amber.withOpacity(0.5),
                ),
                child: const Text(
                  'GET ROASTED',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
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

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
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
    return AnimatedBuilder(
      animation: _bounceAnimation,
      builder: (context, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Transform.scale(
            scale: _bounceAnimation.value,
            child: InsultBubble(
              widget.message,
              isLast: true,
              random: Random(),
              insultLevel: widget.level,
            ),
          ),
        );
      },
    );
  }
}