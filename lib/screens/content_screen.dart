import 'package:flutter/material.dart';
import 'package:areyousure/screens/chat_screen.dart';
import 'package:areyousure/screens/motivation_screen.dart';
import 'package:areyousure/screens/joke_screen.dart';
import 'package:areyousure/screens/wisdom_screen.dart';
import 'package:areyousure/screens/curse_screen.dart';

class TitleScreen extends StatefulWidget {
  const TitleScreen({super.key});

  @override
  State<TitleScreen> createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen> {
  final int _initialPage = 1000;
  late PageController _pageController;
  int _currentPage = 0;

  final List<Map<String, dynamic>> _pages = [
    {
      'title': 'DO YOU KNOW ME',
      'icon': Icons.person_search,
      'color': Colors.cyan,
      'screen': const ChatScreen(),
    },
    {
      'title': 'NEVER HAVE I EVER',
      'icon': Icons.block,
      'color': Colors.pink,
      'screen': const ChatMotivationScreen(),
    },
    {
      'title': 'MOST LIKELY TO',
      'icon': Icons.groups,
      'color': Colors.orange,
      'screen': const ChatJokeScreen(),
    },
    {
      'title': 'TRUTH OR DARE',
      'icon': Icons.casino,
      'color': Colors.redAccent,
      'screen': const ChatWisdomScreen(),
    },
    {
      'title': 'THIS OR THAT',
      'icon': Icons.compare_arrows,
      'color': Colors.green,
      'screen': const ChatCursedScreen(),
    },
    {
      'title': 'FINISH THE SENTENCE',
      'icon': Icons.edit_note,
      'color': Colors.blueAccent,
      'screen': const _FinishSentencePlaceholderScreen(),
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: _initialPage,
    );

    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round() % _pages.length;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 800),
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          children: [
            // Logo
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 175,
                  width: 175,
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'CHOOSE YOUR GAME MODE',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),

            // Page Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index
                        ? _pages[index]['color']
                        : Colors.grey[600],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Infinite Carousel
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemBuilder: (context, index) {
                  final actualIndex = index % _pages.length;

                  return GestureDetector(
                    onTap: () => _navigateToScreen(
                      context,
                      _pages[actualIndex]['screen'],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: AnimatedScale(
                        duration: const Duration(milliseconds: 100),
                        scale: _currentPage == actualIndex ? 1.0 : 0.9,
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: Colors.grey[800],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Icon(
                                    _pages[actualIndex]['icon'],
                                    size: 100,
                                    color: _pages[actualIndex]['color'],
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(20),
                                child: Text(
                                  _pages[actualIndex]['title'],
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: _pages[actualIndex]['color'],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _FinishSentencePlaceholderScreen extends StatelessWidget {
  const _FinishSentencePlaceholderScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Finish the Sentence'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Text(
            'Finish the Sentence mode is ready in data.\nScreen wiring can be added next.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
