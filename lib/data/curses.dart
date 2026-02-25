import 'dart:math';

class CurseGenerator {
  final List<String> _questions = const [
    'This or That: beach vacation or mountain getaway?',
    'This or That: coffee or tea?',
    'This or That: early bird or night owl?',
    'This or That: city life or countryside life?',
    'This or That: sweet snacks or salty snacks?',
    'This or That: books or podcasts?',
    'This or That: movies at home or cinema night?',
    'This or That: Android or iOS?',
    'This or That: loyalty or honesty?',
    'This or That: stability or adventure?',
    'This or That: plan everything or go with the flow?',
    'This or That: deep talks or fun chaos?',
    'This or That: summer or winter?',
    'This or That: texting or calling?',
    'This or That: sneakers or sandals?',
    'This or That: pizza or burger?',
    'This or That: morning workout or evening workout?',
    'This or That: comedy or thriller?',
    'This or That: introvert night or extrovert night?',
    'This or That: online shopping or in-store shopping?',
    'This or That: tea with sugar or no sugar?',
    'This or That: big party or small gathering?',
    'This or That: cats or dogs?',
    'This or That: sweet breakfast or savory breakfast?',
    'This or That: mountains or ocean?',
    'This or That: fame or peace?',
    'This or That: rich life or simple life?',
    'This or That: music festival or road trip?',
    'This or That: strict routine or flexible routine?',
    'This or That: home cooking or takeaway?',
    'This or That: sunrise or sunset?',
    'This or That: rainy days or sunny days?',
    'This or That: headphones or speakers?',
    'This or That: notebooks or digital notes?',
    'This or That: tea at night or coffee in the morning?',
    'This or That: sneakers or boots?',
    'This or That: long drive or short flight?',
    'This or That: spicy food or mild food?',
    'This or That: window seat or aisle seat?',
    'This or That: beach walk or city walk?',
    'This or That: live concert or house party?',
    'This or That: action movies or documentaries?',
    'This or That: iPad or laptop?',
    'This or That: voice notes or typed messages?',
    'This or That: tea shop or coffee shop?',
    'This or That: startup life or corporate life?',
    'This or That: staying in or going out?',
    'This or That: group trip or solo trip?',
    'This or That: planned day or spontaneous day?',
    'This or That: reading fiction or non-fiction?',
    'This or That: first move or wait for them to text first?',
    'This or That: cute nickname or full name?',
    'This or That: hand holding or forehead kiss?',
    'This or That: late-night chat or morning good morning text?',
    'This or That: soft romance or chaotic romance?',
    'This or That: playful teasing or sweet compliments?',
    'This or That: secret crush or public crush?',
    'This or That: slow burn or instant spark?',
    'This or That: matching outfits or matching playlists?',
    'This or That: dinner date or coffee date?',
    'This or That: flirty banter or deep conversation?',
    'This or That: \"good morning\" text or \"good night\" text?',
    'This or That: public compliments or private compliments?',
    'This or That: first date walk or first date dinner?',
    'This or That: playful teasing or straightforward flirting?',
    'This or That: surprise flowers or surprise food?',
    'This or That: movie date or arcade date?',
    'This or That: voice note confession or text confession?',
    'This or That: cute chaos or calm romance?',
    'This or That: eye contact or shy smile?',
    'This or That: instant chemistry or slow connection?',
    'This or That: matching lockscreen or matching bracelets?',
    'This or That: one big gesture or many small gestures?',
    'This or That: secret crush or obvious crush?',
    'This or That: long hugs or hand holding?',
    'This or That: sweet nickname or playful nickname?',
    'This or That: spontaneous date or planned date?',
    'This or That: rooftop date or beach date?',
    'This or That: bold first move or subtle hints?',
    'This or That: texts all day or one deep late-night call?',
    'This or That: dramatic love story or peaceful love story?',
    'This or That: cute selfies together or candid photos?',
    'This or That: gifting snacks or gifting notes?',
    'This or That: funny partner or romantic partner?',
    'This or That: protective vibe or chill vibe?',
  ];

  final Random _random = Random();
  late final List<String> _allQuestions = [
    ..._questions,
    ..._buildBonusQuestions(),
  ];

  List<String> _buildBonusQuestions() {
    final templates = [
      'This or That for {topic}: speed or quality?',
      'This or That for {topic}: safe choice or risky choice?',
      'This or That for {topic}: solo style or team style?',
      'This or That for {topic}: budget option or premium option?',
      'This or That for {topic}: classic route or new route?',
      'This or That for {topic}: morning plan or night plan?',
      'This or That for {topic}: logic first or feelings first?',
      'This or That for {topic}: short-term gain or long-term gain?',
      'This or That for {topic}: structured plan or free flow?',
      'This or That for {topic}: quiet mode or high-energy mode?',
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

