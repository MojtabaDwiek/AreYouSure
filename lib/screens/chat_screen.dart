import 'dart:math';
import 'package:areyousure/data/insults.dart';
import 'package:areyousure/models/message.dart';
import 'package:areyousure/widgets/insult_bubble.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> _messages = [];
  final TextEditingController _controller = TextEditingController();
  String _roastLevel = 'mild';
  final Random _random = Random();
  final List<String> _roastLevels = ['mild', 'medium', 'spicy', 'nuclear'];
  late HybridInsultGenerator _insultGenerator;

  @override
  void initState() {
    super.initState();
    _insultGenerator = HybridInsultGenerator();
  }

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;
    
    setState(() {
      _messages.add(Message(text: _controller.text, isUser: true, isSystem: true));
      _controller.clear();
      
      Future.delayed(const Duration(milliseconds: 500), _addInsult);
    });
  }

  void _addInsult() {
    // Generate a fresh insult each time instead of using pre-made ones
    final insult = _insultGenerator.generateInsult(level: _roastLevel);
    
    setState(() {
      _messages.add(Message(text: insult, isUser: false, isSystem: true));
    });
  }

  void _changeRoastLevel(String? newLevel) {
    if (newLevel != null) {
      setState(() {
        _roastLevel = newLevel;
        _messages.add(Message(
          text: "Roast level set to: ${newLevel.toUpperCase()}",
          isUser: false,
          isSystem: true,
        ));
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _getLevelColor(String level) {
    switch (level) {
      case 'mild':
        return Colors.green;
      case 'medium':
        return Colors.yellow;
      case 'spicy':
        return Colors.orange;
      case 'nuclear':
        return Colors.red;
      default:
        return Colors.amber;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.warning_amber_rounded, color: Colors.amber),
                const SizedBox(width: 8),
                Text(
                  'A R E  Y O U  S U R E ?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    color: Colors.amber,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.amber.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Icon(Icons.warning_amber_rounded, color: Colors.amber),
              ],
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButton<String>(
                value: _roastLevel,
                dropdownColor: Colors.grey[900],
                icon: Icon(Icons.arrow_drop_down, color: Colors.amber, size: 20),
                underline: Container(),
                style: TextStyle(
                  color: _getLevelColor(_roastLevel),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                items: _roastLevels.map((String level) {
                  return DropdownMenuItem<String>(
                    value: level,
                    child: Text(
                      level.toUpperCase(),
                      style: TextStyle(
                        color: _getLevelColor(level),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: _changeRoastLevel,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black,
        elevation: 10,
        shadowColor: Colors.amber.withOpacity(0.3),
        toolbarHeight: 100,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.grey[850]!, Colors.grey[900]!],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                padding: const EdgeInsets.only(top: 16),
                itemCount: _messages.length,
                itemBuilder: (ctx, i) {
                  final message = _messages[_messages.length - 1 - i];
                  return InsultBubble(
                    message,
                    isLast: i == 0,
                    random: _random,
                  );
                },
              ),
            ),
            _buildInputArea(),
          ],
        ),
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Type something you\'ll regret...',
                hintStyle: const TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
              onSubmitted: (_) => _sendMessage(),
            ),
          ),
          Transform.rotate(
            angle: -0.2,
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.amber),
              onPressed: _sendMessage,
            ),
          ),
        ],
      ),
    );
  }
}