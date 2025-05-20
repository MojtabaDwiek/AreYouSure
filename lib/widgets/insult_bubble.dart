import 'dart:math';
import 'package:flutter/material.dart';
import 'package:areyousure/models/message.dart';

class InsultBubble extends StatelessWidget {
  final Message message;
  final bool isLast;
  final Random random;
  final bool isLoading;
  final String insultLevel;
  
  const InsultBubble(
    this.message, {
    super.key,
    required this.isLast,
    required this.random,
    this.isLoading = false,
    required this.insultLevel,
  });

  @override
  Widget build(BuildContext context) {
    final isUser = message.isUser;
    final bubbleColor = isUser 
        ? Colors.blue
        : _getInsultColor(insultLevel);
    final textColor = isUser ? Colors.white : Colors.black;

    return Padding(
      padding: EdgeInsets.only(
        top: 8,
        bottom: isLast ? 16 : 8,
        left: isUser ? 64 : 8,
        right: isUser ? 8 : 64,
      ),
      child: Transform.rotate(
        angle: isUser ? 0 : _getRandomTilt(random),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: bubbleColor,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(20),
              topRight: const Radius.circular(20),
              bottomLeft: Radius.circular(isUser ? 20 : 4),
              bottomRight: Radius.circular(isUser ? 4 : 20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
            border: Border.all(
              color: Colors.black.withOpacity(0.1),
              width: 1,
            ),
          ),
          child: Center(
            child: isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Text(
                    message.text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontStyle: isUser ? FontStyle.normal : FontStyle.italic,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Color _getInsultColor(String level) {
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
        return Colors.green;
    }
  }

  double _getRandomTilt(Random random) {
    return (random.nextDouble() * 0.2) - 0.1;
  }
}