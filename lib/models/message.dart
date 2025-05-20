class Message {
  final String text;
  final bool isUser;
  final bool isSystem;
  final String? level; // Add this field

  Message({
    required this.text,
    this.isUser = false,
    this.isSystem = false,
    this.level,
  });
}