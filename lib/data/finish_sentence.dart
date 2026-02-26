import 'dart:math';

class FinishTheSentenceGenerator {
  final List<String> _questions = const [
    'The moment I feel most confident is when...',
    'If I could instantly master one skill, it would be...',
    'My perfect weekend starts with...',
    'One thing I wish people understood about me is...',
    'When I need motivation, I always...',
    'The best advice I ever got was...',
    'I feel most at peace when...',
    'A habit I want to build this year is...',
    'If money were not a problem, I would...',
    'The person who inspires me most is...',
    'I know I am improving because...',
    'My next chapter starts with...',
    'The hardest lesson I learned was...',
    'I feel loved when...',
    'One thing I need to let go of is...',
    'I feel proud of myself when...',
    'My biggest dream right now is...',
    'The quality I value most is...',
    'I feel calm when...',
    'The habit that changed my life is...',
    'I need more of this in my life...',
    'A fear I want to overcome is...',
    'I feel strongest when...',
    'My comfort place is...',
    'One promise I want to keep is...',
    'I feel inspired by...',
    'What I want to improve first is...',
    'A memory I always smile at is...',
    'My future self would thank me for...',
    'Today I want to focus on...',
    'I feel most connected when...',
    'A skill I want to practice more is...',
    'One thing I need less of is...',
    'The hardest part of my day is...',
    'I feel understood when people...',
    'A place I want to visit next is...',
    'One thing I admire in others is...',
    'My confidence grows when I...',
    'A boundary I am learning to keep is...',
    'I feel happiest when my day includes...',
    'Something I want to forgive is...',
    'I know I am stressed when I...',
    'The best part of my week was...',
    'My current focus is becoming more...',
    'One thing I should celebrate more is...',
    'I feel brave when I choose to...',
    'A small win I had recently was...',
    'The habit I want to start tomorrow is...',
    'A conversation I need to have is...',
    'I would feel lighter if I...',
    'The most awkward message I ever sent was...',
    'I acted cool, but inside I was...',
    'If my crush saw my search history, I would...',
    'My most embarrassing flirt attempt was...',
    'I knew I liked someone when...',
    'One compliment that made me melt was...',
    'If I had to send one bold text today, it would be...',
    'My most dramatic jealous moment was...',
    'The cheesiest line I secretly like is...',
    'The last time I blushed for no reason was when...',
    'If I sent a bold text tonight, it would say...',
    'The most embarrassing way I showed I liked someone was...',
    'I pretend to be chill, but actually I...',
    'If my friends saw my flirty drafts, they would...',
    'The quickest way to make me blush is...',
    'I knew I was in trouble when I started...',
    'The funniest misunderstanding I had in chat was...',
    'One harmless naughty thought I laugh about is...',
    'I act brave, but before a date I always...',
    'The \"I cannot believe I sent that\" moment was...',
    'One green flag that instantly gets me is...',
    'One red flag I ignored once was...',
    'I look confident, but in my head I am...',
    'My most dramatic crush behavior is...',
    'If someone flirts with me, I usually...',
    'The last compliment that ruined my composure was...',
    'I accidentally flirt when I...',
    'My favorite \"cute but chaotic\" moment is...',
    'If I had to confess in one line, I would say...',
    'The way I know I like someone is when I...',
    'My embarrassing social reflex is to...',
    'If I could unsend one message, it would be the one where I...',
    'The one thing I pretend not to notice is...',
    'When I catch feelings, my personality becomes...',
    'The most awkward \"seen\" moment was when...',
  ];

  final Random _random = Random();
  late final List<String> _allQuestions = [
    ..._questions,
    ..._buildBonusQuestions(),
  ];

  List<String> _buildBonusQuestions() {
    final templates = [
      'When it comes to {topic}, I usually...',
      'My biggest challenge in {topic} is...',
      'One promise I can make about {topic} is...',
      'I feel more confident in {topic} when...',
      'A lesson I learned from {topic} is...',
      'If I had more time for {topic}, I would...',
      'The next step I should take in {topic} is...',
      'What I want most from {topic} is...',
      'The habit that would improve my {topic} is...',
      'I would celebrate my progress in {topic} by...',
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


