import 'dart:math';

class CurseGenerator {
  final List<String> _questions = const [
    'beach vacation or mountain getaway?',
    'coffee or tea?',
    'early bird or night owl?',
    'city life or countryside life?',
    'sweet snacks or salty snacks?',
    'books or podcasts?',
    'movies at home or cinema night?',
    'Android or iOS?',
    'loyalty or honesty?',
    'stability or adventure?',
    'plan everything or go with the flow?',
    'deep talks or fun chaos?',
    'summer or winter?',
    'texting or calling?',
    'sneakers or sandals?',
    'pizza or burger?',
    'morning workout or evening workout?',
    'comedy or thriller?',
    'introvert night or extrovert night?',
    'online shopping or in-store shopping?',
    'tea with sugar or no sugar?',
    'big party or small gathering?',
    'cats or dogs?',
    'sweet breakfast or savory breakfast?',
    'mountains or ocean?',
    'fame or peace?',
    'rich life or simple life?',
    'music festival or road trip?',
    'strict routine or flexible routine?',
    'home cooking or takeaway?',
    'sunrise or sunset?',
    'rainy days or sunny days?',
    'headphones or speakers?',
    'notebooks or digital notes?',
    'tea at night or coffee in the morning?',
    'sneakers or boots?',
    'long drive or short flight?',
    'spicy food or mild food?',
    'window seat or aisle seat?',
    'beach walk or city walk?',
    'live concert or house party?',
    'action movies or documentaries?',
    'iPad or laptop?',
    'voice notes or typed messages?',
    'tea shop or coffee shop?',
    'startup life or corporate life?',
    'staying in or going out?',
    'group trip or solo trip?',
    'planned day or spontaneous day?',
    'reading fiction or non-fiction?',
    'first move or wait for them to text first?',
    'cute nickname or full name?',
    'hand holding or forehead kiss?',
    'late-night chat or morning good morning text?',
    'soft romance or chaotic romance?',
    'playful teasing or sweet compliments?',
    'secret crush or public crush?',
    'slow burn or instant spark?',
    'matching outfits or matching playlists?',
    'dinner date or coffee date?',
    'flirty banter or deep conversation?',
    '\"good morning\" text or \"good night\" text?',
    'public compliments or private compliments?',
    'first date walk or first date dinner?',
    'playful teasing or straightforward flirting?',
    'surprise flowers or surprise food?',
    'movie date or arcade date?',
    'voice note confession or text confession?',
    'cute chaos or calm romance?',
    'eye contact or shy smile?',
    'instant chemistry or slow connection?',
    'matching lockscreen or matching bracelets?',
    'one big gesture or many small gestures?',
    'secret crush or obvious crush?',
    'long hugs or hand holding?',
    'sweet nickname or playful nickname?',
    'spontaneous date or planned date?',
    'rooftop date or beach date?',
    'bold first move or subtle hints?',
    'texts all day or one deep late-night call?',
    'dramatic love story or peaceful love story?',
    'cute selfies together or candid photos?',
    'gifting snacks or gifting notes?',
    'funny partner or romantic partner?',
    'protective vibe or chill vibe?',
  ];

  final Random _random = Random();
  late final List<String> _allQuestions = [
    ..._questions,
    ..._buildBonusQuestions(),
  ];

  List<String> _buildBonusQuestions() {
    final templates = [
      'speed or quality?',
      'safe choice or risky choice?',
      'solo style or team style?',
      'budget option or premium option?',
      'classic route or new route?',
      'morning plan or night plan?',
      'logic first or feelings first?',
      'short-term gain or long-term gain?',
      'structured plan or free flow?',
      'quiet mode or high-energy mode?',
    ];
    final topics = ['study', 'travel', 'fitness', 'career', 'relationships'];
    final result = <String>[];
    for (final topic in topics) {
      for (final template in templates) {
        result.add(template.replaceAll('{topic}', topic));
      }
    }
    return result;
  }

  String generateCurse({String level = 'spooky'}) {
    return _allQuestions[_random.nextInt(_allQuestions.length)];
  }
}


