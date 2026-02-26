import 'dart:math';

class HybridInsultGenerator {
  final List<String> _questions = const [
    'what is my go-to comfort food?',
    'what is my biggest pet peeve?',
    'what usually calms me down quickly?',
    'what is my ideal weekend plan?',
    'what type of music do I replay most?',
    'what is one place I really want to visit?',
    'what does my perfect day include?',
    'what is my favorite way to celebrate?',
    'what is my most common late-night snack?',
    'what is one thing that always makes me laugh?',
    'what is my most used app?',
    'what is one goal I keep talking about?',
    'what is my dream job?',
    'what is my favorite movie genre?',
    'what is my favorite season?',
    'what time do I usually sleep?',
    'what is one thing I am afraid of?',
    'what is my favorite dessert?',
    'what annoys me the fastest?',
    'what is my morning routine?',
    'what is my favorite social app?',
    'what do I usually order at restaurants?',
    'what is my favorite hobby?',
    'what is my biggest strength?',
    'what kind of weather do I love?',
    'what is my biggest weakness?',
    'what is my favorite holiday?',
    'what outfit style do I prefer?',
    'what is one thing I never skip?',
    'what does success mean to me?',
    'what is my favorite time to work?',
    'what kind of gifts do I like most?',
    'what is my worst habit?',
    'what makes me feel instantly better?',
    'what is my favorite childhood memory topic?',
    'what kind of people do I trust quickly?',
    'what is a food I cannot stand?',
    'what is my favorite day of the week?',
    'what is my communication style in conflict?',
    'what is one thing I always procrastinate?',
    'what is my favorite kind of vacation?',
    'what is my hidden talent?',
    'what is one thing I buy too often?',
    'what kind of compliments I value most?',
    'what is my favorite way to recharge?',
    'what is my top priority this year?',
    'what kind of movies do I avoid?',
    'what is my biggest deal-breaker in friendships?',
    'what is my favorite meal of the day?',
    'what is one place that feels like home to me?',
    'what type of flirting makes me cringe?',
    'what kind of date would I actually enjoy?',
    'what is my biggest awkward social habit?',
    'what compliment works on me every time?',
    'what is my red flag in relationships?',
    'what trait instantly attracts me to someone?',
    'what romantic gesture would I find cute?',
    'what text reply style annoys me most?',
    'what kind of flirting makes me smile fastest?',
    'what date idea fits my vibe best?',
    'what is my biggest cringe trigger in chats?',
    'what tiny romantic gesture I secretly love?',
    'what compliment style works on me best?',
    'what kind of confidence attracts me most?',
    'what is my awkward habit when I like someone?',
    'what is my funniest social fail pattern?',
    'what kind of first impression wins me over?',
    'what is my texting red flag?',
    'what type of humor instantly gets my attention?',
    'what is my comfort phrase when I am nervous?',
    'what do I notice first about people?',
    'what is my hidden soft spot?',
    'what type of apology feels real to me?',
    'what playful thing embarrasses me quickly?',
    'what is my reaction when I receive unexpected praise?',
    'what kind of connection do I trust most?',
    'what small behavior makes me feel special?',
    'what is my biggest \"green flag\" preference?',
    'what subtle thing instantly turns me off?',
    'what type of confidence feels fake to me?',
    'what is my most \"I am pretending to be chill\" behavior?',
    'what kind of flirting do I find too much?',
    'what is my sweet-but-awkward side like?',
  ];

  final Random _random = Random();
  late final List<String> _allQuestions = [
    ..._questions,
    ..._buildBonusQuestions(),
  ];

  List<String> _buildBonusQuestions() {
    final templates = [
      'what is my usual approach to {topic}?',
      'what do I value most about {topic}?',
      'what is my biggest struggle with {topic}?',
      'what is my favorite part of {topic}?',
      'what would I change first about my {topic}?',
      'what is one rule I follow in {topic}?',
      'what is one thing I avoid in {topic}?',
      'what motivates me most in {topic}?',
      'what is my long-term goal around {topic}?',
      'what is my personality style in {topic}?',
    ];
    final topics = ['work', 'money', 'health', 'friendships', 'travel'];
    final result = <String>[];
    for (final topic in topics) {
      for (final template in templates) {
        result.add(template.replaceAll('{topic}', topic));
      }
    }
    return result;
  }

  String generateInsult({String level = 'mild'}) {
    return _allQuestions[_random.nextInt(_allQuestions.length)];
  }
}


