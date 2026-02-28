import 'package:areyousure/data/wisdom.dart';
import 'package:areyousure/widgets/pull_question_deck.dart';
import 'package:flutter/material.dart';

class ChatWisdomScreen extends StatefulWidget {
  const ChatWisdomScreen({super.key});

  @override
  State<ChatWisdomScreen> createState() => _ChatWisdomScreenState();
}

class _ChatWisdomScreenState extends State<ChatWisdomScreen> {
  late WisdomGenerator _wisdomGenerator;
  bool _isDarkMode = true;
  bool _isTyping = false;
  String _selectedType = 'TRUTH';

  @override
  void initState() {
    super.initState();
    _wisdomGenerator = WisdomGenerator();
  }

  Future<String> _addQuestion(String type) async {
    setState(() {
      _isTyping = true;
    });

    final question = type == 'TRUTH'
        ? _wisdomGenerator.generateTruth()
        : _wisdomGenerator.generateDare();

    setState(() {
      _isTyping = false;
    });

    return question;
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
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                child: Row(
                  children: [
                    Expanded(
                      child: ChoiceChip(
                        label: const SizedBox(
                          width: double.infinity,
                          child: Text(
                            'TRUTH',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        selected: _selectedType == 'TRUTH',
                        onSelected: _isTyping
                            ? null
                            : (selected) {
                                if (!selected) return;
                                setState(() {
                                  _selectedType = 'TRUTH';
                                });
                              },
                        selectedColor: Colors.blueAccent,
                        labelStyle: TextStyle(
                          color: _selectedType == 'TRUTH'
                              ? Colors.white
                              : Colors.blueAccent,
                        ),
                        side: const BorderSide(color: Colors.blueAccent),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ChoiceChip(
                        label: const SizedBox(
                          width: double.infinity,
                          child: Text(
                            'DARE',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        selected: _selectedType == 'DARE',
                        onSelected: _isTyping
                            ? null
                            : (selected) {
                                if (!selected) return;
                                setState(() {
                                  _selectedType = 'DARE';
                                });
                              },
                        selectedColor: Colors.redAccent,
                        labelStyle: TextStyle(
                          color: _selectedType == 'DARE'
                              ? Colors.white
                              : Colors.redAccent,
                        ),
                        side: const BorderSide(color: Colors.redAccent),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PullQuestionDeck(
                  accentColor: _selectedType == 'TRUTH'
                      ? Colors.blueAccent
                      : Colors.redAccent,
                  label: _selectedType,
                  icon: _selectedType == 'TRUTH'
                      ? Icons.visibility
                      : Icons.whatshot,
                  onRevealQuestion: () => _addQuestion(_selectedType),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
