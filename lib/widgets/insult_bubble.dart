import 'dart:math';

import 'package:areyousure/models/message.dart';
import 'package:flutter/material.dart';

class InsultBubble extends StatelessWidget {
  final Message message;

  const InsultBubble(this.message, {super.key, required bool isLast, required Random random});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: message.isUser ? Colors.blue[100] : Colors.red[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          message.text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}