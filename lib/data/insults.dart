import 'dart:math';

class HybridInsultGenerator {
  final List<String> _questions = const [
    'How well do you know me: what is my go-to comfort food?',
    'How well do you know me: what is my biggest pet peeve?',
    'How well do you know me: what usually calms me down quickly?',
    'How well do you know me: what is my ideal weekend plan?',
    'How well do you know me: what type of music do I replay most?',
    'How well do you know me: what is one place I really want to visit?',
    'How well do you know me: what does my perfect day include?',
    'How well do you know me: what is my favorite way to celebrate?',
    'How well do you know me: what is my most common late-night snack?',
    'How well do you know me: what is one thing that always makes me laugh?',
    'How well do you know me: what is my most used app?',
    'How well do you know me: what is one goal I keep talking about?',
    'How well do you know me: what is my dream job?',
    'How well do you know me: what is my favorite movie genre?',
    'How well do you know me: what is my favorite season?',
    'How well do you know me: what time do I usually sleep?',
    'How well do you know me: what is one thing I am afraid of?',
    'How well do you know me: what is my favorite dessert?',
    'How well do you know me: what annoys me the fastest?',
    'How well do you know me: what is my morning routine?',
    'How well do you know me: what is my favorite social app?',
    'How well do you know me: what do I usually order at restaurants?',
    'How well do you know me: what is my favorite hobby?',
    'How well do you know me: what is my biggest strength?',
    'How well do you know me: what kind of weather do I love?',
    'How well do you know me: what is my biggest weakness?',
    'How well do you know me: what is my favorite holiday?',
    'How well do you know me: what outfit style do I prefer?',
    'How well do you know me: what is one thing I never skip?',
    'How well do you know me: what does success mean to me?',
    'How well do you know me: what is my favorite time to work?',
    'How well do you know me: what kind of gifts do I like most?',
    'How well do you know me: what is my worst habit?',
    'How well do you know me: what makes me feel instantly better?',
    'How well do you know me: what is my favorite childhood memory topic?',
    'How well do you know me: what kind of people do I trust quickly?',
    'How well do you know me: what is a food I cannot stand?',
    'How well do you know me: what is my favorite day of the week?',
    'How well do you know me: what is my communication style in conflict?',
    'How well do you know me: what is one thing I always procrastinate?',
    'How well do you know me: what is my favorite kind of vacation?',
    'How well do you know me: what is my hidden talent?',
    'How well do you know me: what is one thing I buy too often?',
    'How well do you know me: what kind of compliments I value most?',
    'How well do you know me: what is my favorite way to recharge?',
    'How well do you know me: what is my top priority this year?',
    'How well do you know me: what kind of movies do I avoid?',
    'How well do you know me: what is my biggest deal-breaker in friendships?',
    'How well do you know me: what is my favorite meal of the day?',
    'How well do you know me: what is one place that feels like home to me?',
    'How well do you know me: what type of flirting makes me cringe?',
    'How well do you know me: what kind of date would I actually enjoy?',
    'How well do you know me: what is my biggest awkward social habit?',
    'How well do you know me: what compliment works on me every time?',
    'How well do you know me: what is my red flag in relationships?',
    'How well do you know me: what trait instantly attracts me to someone?',
    'How well do you know me: what romantic gesture would I find cute?',
    'How well do you know me: what text reply style annoys me most?',
    'How well do you know me: what kind of flirting makes me smile fastest?',
    'How well do you know me: what date idea fits my vibe best?',
    'How well do you know me: what is my biggest cringe trigger in chats?',
    'How well do you know me: what tiny romantic gesture I secretly love?',
    'How well do you know me: what compliment style works on me best?',
    'How well do you know me: what kind of confidence attracts me most?',
    'How well do you know me: what is my awkward habit when I like someone?',
    'How well do you know me: what is my funniest social fail pattern?',
    'How well do you know me: what kind of first impression wins me over?',
    'How well do you know me: what is my texting red flag?',
    'How well do you know me: what type of humor instantly gets my attention?',
    'How well do you know me: what is my comfort phrase when I am nervous?',
    'How well do you know me: what do I notice first about people?',
    'How well do you know me: what is my hidden soft spot?',
    'How well do you know me: what type of apology feels real to me?',
    'How well do you know me: what playful thing embarrasses me quickly?',
    'How well do you know me: what is my reaction when I receive unexpected praise?',
    'How well do you know me: what kind of connection do I trust most?',
    'How well do you know me: what small behavior makes me feel special?',
    'How well do you know me: what is my biggest \"green flag\" preference?',
    'How well do you know me: what subtle thing instantly turns me off?',
    'How well do you know me: what type of confidence feels fake to me?',
    'How well do you know me: what is my most \"I am pretending to be chill\" behavior?',
    'How well do you know me: what kind of flirting do I find too much?',
    'How well do you know me: what is my sweet-but-awkward side like?',
  ];

  final Random _random = Random();
  late final List<String> _allQuestions = [
    ..._questions,
    ..._buildBonusQuestions(),
  ];

  List<String> _buildBonusQuestions() {
    final templates = [
      'How well do you know me: what is my usual approach to {topic}?',
      'How well do you know me: what do I value most about {topic}?',
      'How well do you know me: what is my biggest struggle with {topic}?',
      'How well do you know me: what is my favorite part of {topic}?',
      'How well do you know me: what would I change first about my {topic}?',
      'How well do you know me: what is one rule I follow in {topic}?',
      'How well do you know me: what is one thing I avoid in {topic}?',
      'How well do you know me: what motivates me most in {topic}?',
      'How well do you know me: what is my long-term goal around {topic}?',
      'How well do you know me: what is my personality style in {topic}?',
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

