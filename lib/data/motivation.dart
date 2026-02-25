import 'dart:math';

class MotivationGenerator {
  final List<String> _questions = const [
    'Never have I ever sent a text to the wrong person.',
    'Never have I ever pretended to be busy to avoid plans.',
    'Never have I ever laughed at a joke I did not understand.',
    'Never have I ever blamed someone else for my mistake.',
    'Never have I ever forgotten a close friend\'s birthday.',
    'Never have I ever checked my ex\'s profile.',
    'Never have I ever fallen asleep during a movie.',
    'Never have I ever ghosted someone for no reason.',
    'Never have I ever sang lyrics wrong with confidence.',
    'Never have I ever skipped an alarm on purpose.',
    'Never have I ever laughed in a serious situation.',
    'Never have I ever spent too much money in one day.',
    'Never have I ever lied about being on the way.',
    'Never have I ever taken food from someone else\'s plate.',
    'Never have I ever worn the same outfit two days in a row.',
    'Never have I ever pretended to know a person\'s name.',
    'Never have I ever snooped through someone\'s phone.',
    'Never have I ever stalked my own profile online.',
    'Never have I ever broken something and stayed quiet.',
    'Never have I ever cried during a cartoon.',
    'Never have I ever sent a risky message then regretted it.',
    'Never have I ever canceled plans last minute.',
    'Never have I ever rewatched a series more than three times.',
    'Never have I ever pretended I was sick to avoid school or work.',
    'Never have I ever ignored a call and texted instead.',
    'Never have I ever judged a book by its cover.',
    'Never have I ever forgotten where I put my phone while holding it.',
    'Never have I ever eaten dessert before dinner.',
    'Never have I ever laughed so hard I cried.',
    'Never have I ever searched my own name online.',
    'Never have I ever pretended my phone battery was dead.',
    'Never have I ever snoozed my alarm more than five times.',
    'Never have I ever worn pajamas all day.',
    'Never have I ever lied about reading the terms and conditions.',
    'Never have I ever sent a message and immediately deleted it.',
    'Never have I ever forgotten someone right after they introduced themselves.',
    'Never have I ever laughed at my own joke before anyone else.',
    'Never have I ever eaten straight from the fridge.',
    'Never have I ever watched spoilers then acted surprised.',
    'Never have I ever opened a message and replied days later.',
    'Never have I ever accidentally liked an old post while stalking.',
    'Never have I ever blamed traffic when I left late.',
    'Never have I ever pretended to be asleep to avoid talking.',
    'Never have I ever ignored advice then regretted it.',
    'Never have I ever used \"lol\" while not laughing at all.',
    'Never have I ever gone somewhere just for the food.',
    'Never have I ever replayed an argument in my head for hours.',
    'Never have I ever taken a screenshot of a chat.',
    'Never have I ever forgotten what I walked into a room for.',
    'Never have I ever sent a flirty text and instantly panicked.',
    'Never have I ever practiced a selfie pose in private.',
    'Never have I ever changed clothes three times before a date.',
    'Never have I ever acted cool in front of a crush and failed.',
    'Never have I ever opened a message and overanalyzed every word.',
    'Never have I ever pretended not to care while secretly caring a lot.',
    'Never have I ever rehearsed a voice note before sending it.',
    'Never have I ever checked if someone viewed my story too many times.',
    'Never have I ever deleted and rewritten a message more than five times.',
    'Never have I ever acted jealous and denied it.',
    'Never have I ever had a tiny crush on someone unexpected.',
    'Never have I ever pretended to know a song to look cool.',
    'Never have I ever smiled at my phone for an embarrassing reason.',
    'Never have I ever sent \"haha\" when I was actually blushing.',
    'Never have I ever stalked a crush and liked a very old post by mistake.',
    'Never have I ever typed a message, deleted it, and sent \"hey\" instead.',
    'Never have I ever pretended I was not waiting for a reply.',
    'Never have I ever checked \"last seen\" too many times.',
    'Never have I ever changed my profile picture for one specific person to notice.',
    'Never have I ever opened a chat just to reread old messages.',
    'Never have I ever screenshot a sweet message to keep forever.',
    'Never have I ever acted busy to seem mysterious.',
    'Never have I ever asked a friend to decode a text for me.',
    'Never have I ever posted a story hoping one person would react.',
    'Never have I ever practiced my \"casual\" reply in my head.',
    'Never have I ever got jealous and pretended I was not.',
    'Never have I ever sent a risky message and put my phone away instantly.',
    'Never have I ever searched \"how to flirt\" as a joke but read it seriously.',
    'Never have I ever dressed up for \"just a quick meetup\".',
    'Never have I ever acted confident while panicking inside.',
    'Never have I ever asked \"do I look okay?\" more than three times before leaving.',
    'Never have I ever overused one emoji to look cute.',
    'Never have I ever sent a voice note, deleted it, and sent text instead.',
    'Never have I ever re-read a compliment all day.',
    'Never have I ever pretended to dislike someone I clearly liked.',
    'Never have I ever tried to look unbothered after being left on read.',
    'Never have I ever kept a tiny secret crush for way too long.',
    'Never have I ever used a song lyric as a hidden message.',
  ];

  final Random _random = Random();
  late final List<String> _allQuestions = [
    ..._questions,
    ..._buildBonusQuestions(),
  ];

  List<String> _buildBonusQuestions() {
    final templates = [
      'Never have I ever overthought {topic} for hours.',
      'Never have I ever made a last-minute choice about {topic}.',
      'Never have I ever avoided a conversation about {topic}.',
      'Never have I ever changed my mind about {topic} overnight.',
      'Never have I ever spent too much time researching {topic}.',
      'Never have I ever said yes too quickly to {topic}.',
      'Never have I ever regretted a decision related to {topic}.',
      'Never have I ever learned a hard lesson from {topic}.',
      'Never have I ever delayed progress because of {topic}.',
      'Never have I ever surprised myself with my choice in {topic}.',
    ];
    final topics = ['career', 'relationships', 'money', 'fitness', 'travel'];
    final result = <String>[];
    for (final topic in topics) {
      for (final template in templates) {
        result.add(template.replaceAll('{topic}', topic));
      }
    }
    return result;
  }

  String generateMotivation({String level = 'encouraging'}) {
    return _allQuestions[_random.nextInt(_allQuestions.length)];
  }
}

