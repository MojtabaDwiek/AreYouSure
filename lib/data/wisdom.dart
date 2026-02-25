import 'dart:math';

class WisdomGenerator {
  final List<String> _questions = const [
    'Truth: what is one fear you hide well?',
    'Dare: do your best impression of someone in this room.',
    'Truth: what is your most embarrassing habit?',
    'Dare: dance for 20 seconds with no music.',
    'Truth: what is one lie you told recently?',
    'Dare: speak in a dramatic voice for the next round.',
    'Truth: what is one thing you regret not saying?',
    'Dare: send an emoji-only message to your last chat.',
    'Truth: what is your biggest insecurity?',
    'Dare: sing the chorus of any song right now.',
    'Truth: what is your weirdest fear?',
    'Dare: make a slogan for yourself in 10 seconds.',
    'Truth: who was your first crush?',
    'Dare: do 10 squats right now.',
    'Truth: what is the last thing you cried about?',
    'Dare: talk without saying "um" for one minute.',
    'Truth: what is your biggest red flag?',
    'Dare: imitate a celebrity for 20 seconds.',
    'Truth: what is one secret talent you have?',
    'Dare: say the alphabet backward as far as you can.',
    'Truth: have you ever lied in this game?',
    'Dare: create a 5-second ad for yourself.',
    'Truth: what is a habit you want to quit?',
    'Dare: act like a robot for one round.',
    'Truth: what is your most awkward moment?',
    'Dare: compliment everyone in one sentence each.',
    'Truth: what do you overthink the most?',
    'Dare: freestyle rap for 10 seconds.',
    'Truth: who do you text the most?',
    'Dare: hold a funny face for 15 seconds.',
    'Truth: what is one boundary you struggle to keep?',
    'Dare: say one nice thing about everyone in the room.',
    'Truth: what is your biggest current stress?',
    'Dare: read your last sent message in a dramatic voice.',
    'Truth: when was the last time you felt truly proud?',
    'Dare: do a runway walk for 10 seconds.',
    'Truth: what is one habit that hurts your progress?',
    'Dare: explain your day using only emojis.',
    'Truth: what is something you are still healing from?',
    'Dare: pretend to host a talk show for one minute.',
    'Truth: what do you value most in close friendships?',
    'Dare: act out your favorite movie scene in 15 seconds.',
    'Truth: what is one thing people misunderstand about you?',
    'Dare: balance on one foot while answering the next question.',
    'Truth: what is your biggest \"what if\" thought?',
    'Dare: imitate your own laugh in slow motion.',
    'Truth: what is one decision you are postponing?',
    'Dare: pitch yourself as a superhero in 20 seconds.',
    'Truth: what helps you reset after a bad day?',
    'Dare: speak with a random accent for one round.',
    'Truth: what is your most embarrassing crush moment?',
    'Dare: send a harmless flirty emoji to your best friend.',
    'Truth: what is your cheesiest pickup line?',
    'Dare: read your last text in a seductive movie voice.',
    'Truth: have you ever had a crush on a friend?',
    'Dare: act like you are in a dramatic romance scene for 20 seconds.',
    'Truth: what is the most awkward date moment you have had?',
    'Dare: wink at everyone one by one without laughing.',
    'Truth: what is one compliment you still remember?',
    'Dare: give your best flirty one-liner to the room.',
    'Truth: have you ever pretended not to like someone you liked?',
    'Dare: slow-walk like a model and blow a kiss.',
    'Truth: what is the most embarrassing thing in your camera roll theme?',
    'Dare: confess your current celebrity crush with full confidence.',
    'Truth: what is the boldest text you almost sent?',
    'Dare: send a harmless compliment to someone in your contacts.',
    'Truth: what is one flirty thing that instantly works on you?',
    'Dare: deliver your best pickup line with a straight face.',
    'Truth: what is your most awkward \"seen but no reply\" story?',
    'Dare: narrate yourself like a romantic movie trailer for 15 seconds.',
    'Truth: have you ever pretended to be busy to seem cool?',
    'Dare: recreate your most dramatic selfie pose right now.',
    'Truth: what is your most embarrassing typo in a message?',
    'Dare: make eye contact with someone and say one confident compliment.',
    'Truth: what is one thing you do when you like someone?',
    'Dare: record a 5-second fake dating app intro.',
    'Truth: what is your biggest \"I cannot believe I said that\" moment?',
    'Dare: react to an imaginary love confession in 3 different ways.',
    'Truth: what is one compliment you wish someone would give you?',
    'Dare: act like your crush just walked in the room.',
    'Truth: what is your funniest dating red flag?',
    'Dare: wink and give a dramatic bow.',
    'Truth: what is your most embarrassing social media moment?',
    'Dare: say \"you look great today\" in three accents.',
    'Truth: have you ever panicked after sending a message?',
    'Dare: perform a 10-second slow-motion hair flip.',
    'Truth: what is one \"green flag\" that melts you instantly?',
    'Dare: give a flirty compliment to the nearest object.',
    'Truth: what is your most awkward \"wrong person\" text story?',
    'Dare: pitch yourself as the ideal date in 12 seconds.',
  ];

  final Random _random = Random();
  late final List<String> _allQuestions = [
    ..._questions,
    ..._buildBonusQuestions(),
  ];

  List<String> _buildBonusQuestions() {
    final truthTemplates = [
      'Truth: what did {topic} teach you recently?',
      'Truth: what is your biggest fear in {topic}?',
      'Truth: what do you avoid most about {topic}?',
      'Truth: what is one win you had in {topic}?',
      'Truth: what is one mistake you made in {topic}?',
    ];
    final dareTemplates = [
      'Dare: explain your view on {topic} in 15 seconds.',
      'Dare: act out {topic} silently and let others guess.',
      'Dare: pitch a fun idea about {topic} right now.',
      'Dare: give one bold tip about {topic} like an expert.',
      'Dare: make a short motivational line about {topic}.',
    ];
    final topics = ['money', 'friendship', 'career', 'self-growth', 'love'];
    final result = <String>[];
    for (final topic in topics) {
      for (final template in truthTemplates) {
        result.add(template.replaceAll('{topic}', topic));
      }
      for (final template in dareTemplates) {
        result.add(template.replaceAll('{topic}', topic));
      }
    }
    return result;
  }

  String generateWisdom({String level = 'proverb'}) {
    return _allQuestions[_random.nextInt(_allQuestions.length)];
  }
}

