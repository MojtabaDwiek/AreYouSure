class Message {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  Message({
    required this.text,
    required this.isUser,
    DateTime? timestamp, required bool isSystem,
  }) : timestamp = timestamp ?? DateTime.now();
}