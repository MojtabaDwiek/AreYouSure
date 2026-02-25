import 'dart:math';

class JokeGenerator {
  final List<String> _questions = const [
    'Most likely to forget where they parked?',
    'Most likely to become famous first?',
    'Most likely to text back three days later?',
    'Most likely to cancel plans and stay home?',
    'Most likely to survive a zombie apocalypse?',
    'Most likely to cry during a movie?',
    'Most likely to become a millionaire?',
    'Most likely to accidentally create drama?',
    'Most likely to move to another country?',
    'Most likely to start a business unexpectedly?',
    'Most likely to leave a party first?',
    'Most likely to pull an all-nighter and still function?',
    'Most likely to lose their keys every week?',
    'Most likely to become everyone\'s therapist friend?',
    'Most likely to adopt a pet impulsively?',
    'Most likely to become a stand-up comedian?',
    'Most likely to forget a birthday and panic?',
    'Most likely to travel with no plan?',
    'Most likely to post the best captions?',
    'Most likely to join a reality show?',
    'Most likely to become a teacher?',
    'Most likely to run a marathon?',
    'Most likely to turn a hobby into a business?',
    'Most likely to be late but still look calm?',
    'Most likely to spend all weekend binge-watching?',
    'Most likely to send the longest voice notes?',
    'Most likely to make friends anywhere?',
    'Most likely to get lost with maps on?',
    'Most likely to win a debate?',
    'Most likely to plan a surprise party?',
    'Most likely to become a travel vlogger?',
    'Most likely to start journaling and actually keep up?',
    'Most likely to accidentally break something expensive?',
    'Most likely to adopt a strict routine and stick to it?',
    'Most likely to become a minimalist?',
    'Most likely to host game night every week?',
    'Most likely to be everyone\'s emergency planner?',
    'Most likely to switch careers successfully?',
    'Most likely to buy a last-minute flight?',
    'Most likely to become a chef at home?',
    'Most likely to get addicted to a new hobby quickly?',
    'Most likely to turn their room into a studio?',
    'Most likely to join a dance class first?',
    'Most likely to talk to strangers while traveling?',
    'Most likely to become a content creator full-time?',
    'Most likely to save money consistently?',
    'Most likely to start a book club?',
    'Most likely to make a great team leader?',
    'Most likely to build an app idea into reality?',
    'Most likely to blush first in a flirty conversation?',
    'Most likely to send a risky text then delete it?',
    'Most likely to catch feelings first?',
    'Most likely to practice flirting in the mirror?',
    'Most likely to have an accidental romantic moment in public?',
    'Most likely to fall for someone with a great smile?',
    'Most likely to write and delete a long confession text?',
    'Most likely to get nervous before a date?',
    'Most likely to friend-zone someone by accident?',
    'Most likely to keep screenshots of sweet messages?',
    'Most likely to overthink one text for hours?',
    'Most likely to send \"wrong chat\" and panic?',
    'Most likely to accidentally confess feelings while joking?',
    'Most likely to plan the perfect date and pretend it is casual?',
    'Most likely to get shy after one compliment?',
    'Most likely to use memes to flirt?',
    'Most likely to blush and deny everything?',
    'Most likely to create a playlist for someone secretly?',
    'Most likely to check if someone viewed their story first?',
    'Most likely to write a long message and send a short one?',
    'Most likely to catch feelings from late-night chats?',
    'Most likely to become the \"soft\" one in a relationship?',
    'Most likely to fold first during an argument and send a cute text?',
    'Most likely to daydream about a cute meetup?',
    'Most likely to accidentally like an old photo while stalking?',
    'Most likely to rehearse what to say before a call?',
    'Most likely to become dramatic over mixed signals?',
    'Most likely to tease someone they secretly like?',
    'Most likely to pretend to be calm while heart is racing?',
    'Most likely to save a contact with a secret emoji?',
    'Most likely to send the fastest reply to one special person?',
    'Most likely to have the best flirty comeback?',
    'Most likely to cancel plans just to talk to someone all night?',
    'Most likely to keep a harmless crush hidden for months?',
    'Most likely to act \"unavailable\" and fail immediately?',
    'Most likely to send a risky text at midnight?',
  ];

  final Random _random = Random();
  late final List<String> _allQuestions = [
    ..._questions,
    ..._buildBonusQuestions(),
  ];

  List<String> _buildBonusQuestions() {
    final templates = [
      'Most likely to lead the group during {topic}?',
      'Most likely to panic first when {topic} goes wrong?',
      'Most likely to stay calm during {topic}?',
      'Most likely to turn {topic} into a success story?',
      'Most likely to improvise best around {topic}?',
      'Most likely to overprepare for {topic}?',
      'Most likely to forget details in {topic}?',
      'Most likely to enjoy {topic} the most?',
      'Most likely to become known for {topic}?',
      'Most likely to teach others about {topic}?',
    ];
    final topics = ['a road trip', 'a group project', 'a party', 'a startup idea', 'a public speech'];
    final result = <String>[];
    for (final topic in topics) {
      for (final template in templates) {
        result.add(template.replaceAll('{topic}', topic));
      }
    }
    return result;
  }

  String generateJoke({String level = 'dad'}) {
    return _allQuestions[_random.nextInt(_allQuestions.length)];
  }
}

