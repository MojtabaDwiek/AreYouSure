import 'package:flutter/material.dart';
import 'dart:ui';
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
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 24.0),
                      child: AnimatedBuilder(
                        animation: _pageController,
                        builder: (context, child) {
                          double page = _initialPage.toDouble();
                          if (_pageController.hasClients && _pageController.position.haveDimensions) {
                            page = _pageController.page ?? _initialPage.toDouble();
                          }

                          final double delta = index - page;
                          final double distance = delta.abs().clamp(0.0, 1.0).toDouble();
                          final double scale = 0.86 + (1 - distance) * 0.14;
                          final double rotateY =
                              (delta * 0.35).clamp(-0.35, 0.35).toDouble();

                          return Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.0012)
                              ..rotateY(rotateY),
                            child: Transform.scale(
                              scale: scale,
                              child: child,
                            ),
                          );
                        },
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.35),
                                blurRadius: 24,
                                spreadRadius: 1,
                                offset: const Offset(0, 14),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(26),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(26),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.28),
                                    width: 1.1,
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.white.withOpacity(0.18),
                                      Colors.white.withOpacity(0.07),
                                    ],
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Center(
                                        child: Container(
                                          padding: const EdgeInsets.all(18),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: _pages[actualIndex]['color'].withOpacity(0.12),
                                          ),
                                          child: Icon(
                                            _pages[actualIndex]['icon'],
                                            size: 90,
                                            color: _pages[actualIndex]['color'],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 22),
                                      child: Text(
                                        _pages[actualIndex]['title'],
                                        style: TextStyle(
                                          fontSize: 22,
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
