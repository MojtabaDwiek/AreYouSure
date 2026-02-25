import 'dart:math';

class FinishTheSentenceGenerator {
  final List<String> _questions = const [
    'Finish the sentence: The moment I feel most confident is when...',
    'Finish the sentence: If I could instantly master one skill, it would be...',
    'Finish the sentence: My perfect weekend starts with...',
    'Finish the sentence: One thing I wish people understood about me is...',
    'Finish the sentence: When I need motivation, I always...',
    'Finish the sentence: The best advice I ever got was...',
    'Finish the sentence: I feel most at peace when...',
    'Finish the sentence: A habit I want to build this year is...',
    'Finish the sentence: If money were not a problem, I would...',
    'Finish the sentence: The person who inspires me most is...',
    'Finish the sentence: I know I am improving because...',
    'Finish the sentence: My next chapter starts with...',
    'Finish the sentence: The hardest lesson I learned was...',
    'Finish the sentence: I feel loved when...',
    'Finish the sentence: One thing I need to let go of is...',
    'Finish the sentence: I feel proud of myself when...',
    'Finish the sentence: My biggest dream right now is...',
    'Finish the sentence: The quality I value most is...',
    'Finish the sentence: I feel calm when...',
    'Finish the sentence: The habit that changed my life is...',
    'Finish the sentence: I need more of this in my life...',
    'Finish the sentence: A fear I want to overcome is...',
    'Finish the sentence: I feel strongest when...',
    'Finish the sentence: My comfort place is...',
    'Finish the sentence: One promise I want to keep is...',
    'Finish the sentence: I feel inspired by...',
    'Finish the sentence: What I want to improve first is...',
    'Finish the sentence: A memory I always smile at is...',
    'Finish the sentence: My future self would thank me for...',
    'Finish the sentence: Today I want to focus on...',
    'Finish the sentence: I feel most connected when...',
    'Finish the sentence: A skill I want to practice more is...',
    'Finish the sentence: One thing I need less of is...',
    'Finish the sentence: The hardest part of my day is...',
    'Finish the sentence: I feel understood when people...',
    'Finish the sentence: A place I want to visit next is...',
    'Finish the sentence: One thing I admire in others is...',
    'Finish the sentence: My confidence grows when I...',
    'Finish the sentence: A boundary I am learning to keep is...',
    'Finish the sentence: I feel happiest when my day includes...',
    'Finish the sentence: Something I want to forgive is...',
    'Finish the sentence: I know I am stressed when I...',
    'Finish the sentence: The best part of my week was...',
    'Finish the sentence: My current focus is becoming more...',
    'Finish the sentence: One thing I should celebrate more is...',
    'Finish the sentence: I feel brave when I choose to...',
    'Finish the sentence: A small win I had recently was...',
    'Finish the sentence: The habit I want to start tomorrow is...',
    'Finish the sentence: A conversation I need to have is...',
    'Finish the sentence: I would feel lighter if I...',
    'Finish the sentence: The most awkward message I ever sent was...',
    'Finish the sentence: I acted cool, but inside I was...',
    'Finish the sentence: If my crush saw my search history, I would...',
    'Finish the sentence: My most embarrassing flirt attempt was...',
    'Finish the sentence: I knew I liked someone when...',
    'Finish the sentence: One compliment that made me melt was...',
    'Finish the sentence: If I had to send one bold text today, it would be...',
    'Finish the sentence: My most dramatic jealous moment was...',
    'Finish the sentence: The cheesiest line I secretly like is...',
    'Finish the sentence: The last time I blushed for no reason was when...',
    'Finish the sentence: If I sent a bold text tonight, it would say...',
    'Finish the sentence: The most embarrassing way I showed I liked someone was...',
    'Finish the sentence: I pretend to be chill, but actually I...',
    'Finish the sentence: If my friends saw my flirty drafts, they would...',
    'Finish the sentence: The quickest way to make me blush is...',
    'Finish the sentence: I knew I was in trouble when I started...',
    'Finish the sentence: The funniest misunderstanding I had in chat was...',
    'Finish the sentence: One harmless naughty thought I laugh about is...',
    'Finish the sentence: I act brave, but before a date I always...',
    'Finish the sentence: The \"I cannot believe I sent that\" moment was...',
    'Finish the sentence: One green flag that instantly gets me is...',
    'Finish the sentence: One red flag I ignored once was...',
    'Finish the sentence: I look confident, but in my head I am...',
    'Finish the sentence: My most dramatic crush behavior is...',
    'Finish the sentence: If someone flirts with me, I usually...',
    'Finish the sentence: The last compliment that ruined my composure was...',
    'Finish the sentence: I accidentally flirt when I...',
    'Finish the sentence: My favorite \"cute but chaotic\" moment is...',
    'Finish the sentence: If I had to confess in one line, I would say...',
    'Finish the sentence: The way I know I like someone is when I...',
    'Finish the sentence: My embarrassing social reflex is to...',
    'Finish the sentence: If I could unsend one message, it would be the one where I...',
    'Finish the sentence: The one thing I pretend not to notice is...',
    'Finish the sentence: When I catch feelings, my personality becomes...',
    'Finish the sentence: The most awkward \"seen\" moment was when...',
  ];

  final Random _random = Random();
  late final List<String> _allQuestions = [
    ..._questions,
    ..._buildBonusQuestions(),
  ];

  List<String> _buildBonusQuestions() {
    final templates = [
      'Finish the sentence: When it comes to {topic}, I usually...',
      'Finish the sentence: My biggest challenge in {topic} is...',
      'Finish the sentence: One promise I can make about {topic} is...',
      'Finish the sentence: I feel more confident in {topic} when...',
      'Finish the sentence: A lesson I learned from {topic} is...',
      'Finish the sentence: If I had more time for {topic}, I would...',
      'Finish the sentence: The next step I should take in {topic} is...',
      'Finish the sentence: What I want most from {topic} is...',
      'Finish the sentence: The habit that would improve my {topic} is...',
      'Finish the sentence: I would celebrate my progress in {topic} by...',
    ];
    final topics = ['health', 'career', 'friendships', 'money', 'mindset'];
    final result = <String>[];
    for (final topic in topics) {
      for (final template in templates) {
        result.add(template.replaceAll('{topic}', topic));
      }
    }
    return result;
  }

  String generatePrompt() {
    return _allQuestions[_random.nextInt(_allQuestions.length)];
  }
}

