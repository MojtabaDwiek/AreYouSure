import 'dart:math';

class WisdomGenerator {
  final List<String> _questions = const [
    'what is one fear you hide well?',
    'do your best impression of someone in this room.',
    'what is your most embarrassing habit?',
    'dance for 20 seconds with no music.',
    'what is one lie you told recently?',
    'speak in a dramatic voice for the next round.',
    'what is one thing you regret not saying?',
    'send an emoji-only message to your last chat.',
    'what is your biggest insecurity?',
    'sing the chorus of any song right now.',
    'what is your weirdest fear?',
    'make a slogan for yourself in 10 seconds.',
    'who was your first crush?',
    'do 10 squats right now.',
    'what is the last thing you cried about?',
    'talk without saying "um" for one minute.',
    'what is your biggest red flag?',
    'imitate a celebrity for 20 seconds.',
    'what is one secret talent you have?',
    'say the alphabet backward as far as you can.',
    'have you ever lied in this game?',
    'create a 5-second ad for yourself.',
    'what is a habit you want to quit?',
    'act like a robot for one round.',
    'what is your most awkward moment?',
    'compliment everyone in one sentence each.',
    'what do you overthink the most?',
    'freestyle rap for 10 seconds.',
    'who do you text the most?',
    'hold a funny face for 15 seconds.',
    'what is one boundary you struggle to keep?',
    'say one nice thing about everyone in the room.',
    'what is your biggest current stress?',
    'read your last sent message in a dramatic voice.',
    'when was the last time you felt truly proud?',
    'do a runway walk for 10 seconds.',
    'what is one habit that hurts your progress?',
    'explain your day using only emojis.',
    'what is something you are still healing from?',
    'pretend to host a talk show for one minute.',
    'what do you value most in close friendships?',
    'act out your favorite movie scene in 15 seconds.',
    'what is one thing people misunderstand about you?',
    'balance on one foot while answering the next question.',
    'what is your biggest \"what if\" thought?',
    'imitate your own laugh in slow motion.',
    'what is one decision you are postponing?',
    'pitch yourself as a superhero in 20 seconds.',
    'what helps you reset after a bad day?',
    'speak with a random accent for one round.',
    'what is your most embarrassing crush moment?',
    'send a harmless flirty emoji to your best friend.',
    'what is your cheesiest pickup line?',
    'read your last text in a seductive movie voice.',
    'have you ever had a crush on a friend?',
    'act like you are in a dramatic romance scene for 20 seconds.',
    'what is the most awkward date moment you have had?',
    'wink at everyone one by one without laughing.',
    'what is one compliment you still remember?',
    'give your best flirty one-liner to the room.',
    'have you ever pretended not to like someone you liked?',
    'slow-walk like a model and blow a kiss.',
    'what is the most embarrassing thing in your camera roll theme?',
    'confess your current celebrity crush with full confidence.',
    'what is the boldest text you almost sent?',
    'send a harmless compliment to someone in your contacts.',
    'what is one flirty thing that instantly works on you?',
    'deliver your best pickup line with a straight face.',
    'what is your most awkward \"seen but no reply\" story?',
    'narrate yourself like a romantic movie trailer for 15 seconds.',
    'have you ever pretended to be busy to seem cool?',
    'recreate your most dramatic selfie pose right now.',
    'what is your most embarrassing typo in a message?',
    'make eye contact with someone and say one confident compliment.',
    'what is one thing you do when you like someone?',
    'record a 5-second fake dating app intro.',
    'what is your biggest \"I cannot believe I said that\" moment?',
    'react to an imaginary love confession in 3 different ways.',
    'what is one compliment you wish someone would give you?',
    'act like your crush just walked in the room.',
    'what is your funniest dating red flag?',
    'wink and give a dramatic bow.',
    'what is your most embarrassing social media moment?',
    'say \"you look great today\" in three accents.',
    'have you ever panicked after sending a message?',
    'perform a 10-second slow-motion hair flip.',
    'what is one \"green flag\" that melts you instantly?',
    'give a flirty compliment to the nearest object.',
    'what is your most awkward \"wrong person\" text story?',
    'pitch yourself as the ideal date in 12 seconds.',
  ];

  final Random _random = Random();
  late final List<String> _truthQuestions = [
    for (var i = 0; i < _questions.length; i += 2) _questions[i],
    ..._buildBonusTruthQuestions(),
  ];
  late final List<String> _dareQuestions = [
    for (var i = 1; i < _questions.length; i += 2) _questions[i],
    ..._buildBonusDareQuestions(),
  ];
  late final List<String> _allQuestions = [
    ..._truthQuestions,
    ..._dareQuestions,
  ];

  List<String> _buildBonusTruthQuestions() {
    const truthTemplates = [
      'what did {topic} teach you recently?',
      'what is your biggest fear in {topic}?',
      'what do you avoid most about {topic}?',
      'what is one win you had in {topic}?',
      'what is one mistake you made in {topic}?',
    ];
    const topics = ['money', 'friendship', 'career', 'self-growth', 'love'];
    final result = <String>[];
    for (final topic in topics) {
      for (final template in truthTemplates) {
        result.add(template.replaceAll('{topic}', topic));
      }
    }
    return result;
  }

  List<String> _buildBonusDareQuestions() {
    const dareTemplates = [
      'explain your view on {topic} in 15 seconds.',
      'act out {topic} silently and let others guess.',
      'pitch a fun idea about {topic} right now.',
      'give one bold tip about {topic} like an expert.',
      'make a short motivational line about {topic}.',
    ];
    const topics = ['money', 'friendship', 'career', 'self-growth', 'love'];
    final result = <String>[];
    for (final topic in topics) {
      for (final template in dareTemplates) {
        result.add(template.replaceAll('{topic}', topic));
      }
    }
    return result;
  }

  String generateWisdom({String level = 'proverb'}) {
    return _allQuestions[_random.nextInt(_allQuestions.length)];
  }

  String generateTruth() {
    if (_truthQuestions.isEmpty) return generateWisdom();
    return _truthQuestions[_random.nextInt(_truthQuestions.length)];
  }

  String generateDare() {
    if (_dareQuestions.isEmpty) return generateWisdom();
    return _dareQuestions[_random.nextInt(_dareQuestions.length)];
  }
}


