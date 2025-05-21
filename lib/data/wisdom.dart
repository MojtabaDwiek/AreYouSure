import 'dart:math';

class WisdomGenerator {
  final Map<String, List<String>> _templates = {
    'proverb': [
      "A {noun} in time saves nine, but a wise one {verb}s early.",
      "Don’t count your {noun}s before they {verb}.",
      "A journey of a thousand {noun}s begins with a single {verb}.",
      "Even a {noun} can {verb} if guided well.",
      "When the {noun} is ready, the {adjective} guide appears.",
      "A {adjective} mind can turn a {noun} into a lesson.",
      "He who {verb}s last, {verb}s best with {adjective} wisdom.",
      "The {noun} that bends does not {verb} in the wind.",
      "A {adjective} {noun} speaks louder than a shout.",
      "You can’t {verb} the wind, but you can adjust your {noun}.",
      "Every {noun} has its {adjective} season to {verb}.",
      "Better to {verb} slowly than rush and break the {noun}.",
      "A {noun} without patience cannot {verb} properly.",
      "One who {verb}s often must keep a {adjective} {noun}.",
      "As the {noun} grows, so must your {adjective} {verb}.",
      "Don’t let a small {noun} {verb} your entire day.",
      "The {adjective} path often leads the {noun} to {verb}.",
      "To {verb} wisely, one must tame the {adjective} {noun} within.",
      "Even a broken {noun} can {verb} right twice a day.",
      "Wisdom is when you {verb} even though the {noun} is {adjective}.",
    ],
    'philosophical': [
      "To {verb} is to exist; to exist is to {verb} with {noun}s.",
      "Reality is but a {adjective} {noun} shaped by thought.",
      "A {noun} questions, a wise one {verb}s.",
      "I {verb}, therefore I become the {adjective} {noun}.",
      "The {adjective} truth lies beneath every {noun} we {verb}.",
      "Freedom is not in the {noun}, but in how we {verb} it.",
      "To {verb} is to accept the limits of the {noun}.",
      "Only the {adjective} mind can {verb} a paradoxical {noun}.",
      "Existence precedes the {noun}, yet we still {verb} meaning.",
      "The {noun} you fear holds the key to {verb}ing {adjective}ly.",
      "One must {verb} against the {adjective} tide of the {noun}.",
      "We {verb} not things, but our thoughts about the {noun}s.",
      "In the silence, the {noun} teaches how to {verb}.",
      "A {adjective} {noun} can blind or {verb} you to clarity.",
      "Reason is the {noun} by which we {verb} the world.",
      "Every {noun} is a shadow of what we refuse to {verb}.",
      "The {adjective} self is the one who questions the {noun}.",
      "No {noun} is real until you {verb} it with intent.",
      "We are {adjective} creatures, always trying to {verb} truth from {noun}s.",
      "A {noun} asked is a {verb} answered by the soul.",
    ],
    'spiritual': [
      "Let your {noun} {verb} in divine {adjective} peace.",
      "The {adjective} spirit knows when to {verb} and when to be still.",
      "To {verb} the soul is to feed the {noun} within.",
      "Walk in {adjective} light and your {noun} will {verb} effortlessly.",
      "Each {noun} is a whisper of the divine, waiting to {verb}.",
      "You are not the {noun}, but the one who {verb}s through it.",
      "The {adjective} presence flows when you {verb} without ego.",
      "A {noun} at peace never forgets to {verb} with love.",
      "Even the {adjective} storm cannot {verb} a grounded {noun}.",
      "Let your {noun} be {adjective} as you {verb} forward.",
      "Every {noun} is a blessing if you {verb} with gratitude.",
      "To {verb} in alignment is to dance with {adjective} grace.",
      "Open your {noun} to {verb} divine understanding.",
      "Your {adjective} path is found when you {verb} from within.",
      "To {verb} is to commune with your eternal {noun}.",
      "A {adjective} soul needs no words to {verb}.",
      "Let go and {verb}; the {noun} will carry you.",
      "Wherever your {noun} is, may it {verb} in {adjective} harmony.",
      "{verb} with purpose and the {noun} will guide you.",
      "The {adjective} stillness reveals how the {noun} truly {verb}s.",
    ],
    'enlightened': [
      "The {adjective} truth is that the {noun} is already within you—just {verb} it.",
      "To {verb} without attachment is to see the {noun} clearly.",
      "Enlightenment is a {noun} discovered when you {verb} without fear.",
      "The {adjective} moment is all that is; {verb} in it completely.",
      "A {noun} seen with clarity is no longer a burden but a way to {verb}.",
      "When the self vanishes, the {adjective} {noun} begins to {verb}.",
      "You already {verb}; you only need to see the {noun} as it is.",
      "Every breath is an {adjective} invitation to {verb}.",
      "{verb} as though the {noun} never existed.",
      "The {noun} you seek is the one that lets you {verb}.",
      "In {adjective} silence, the {noun} speaks volumes as you {verb}.",
      "To {verb} the path, become the {noun}.",
      "An {adjective} {noun} asks no questions, only {verb}s.",
      "Awareness is the {noun} with which we {verb} the universe.",
      "Nothing is more {adjective} than a {noun} at rest that can still {verb}.",
      "The {noun} disappears when you {verb} with no self.",
      "True {adjective} living is when your {noun} does not need to {verb}.",
      "When you {verb} as the {noun}, you dissolve the illusion.",
      "Be {adjective}; let your {noun} {verb} freely.",
      "You {verb} the light by realizing you are the {adjective} {noun}.",
    ],
  };

  final Map<String, List<String>> _adjectives = {
    'proverb': ['wise', 'timely', 'clever', 'humble', 'patient', 'brave', 'cautious', 'strong', 'gentle', 'alert'],
    'philosophical': ['deep', 'existential', 'reflective', 'curious', 'rational', 'eternal', 'abstract', 'meaningful', 'mental', 'cognitive'],
    'spiritual': ['divine', 'peaceful', 'graceful', 'centered', 'pure', 'radiant', 'uplifting', 'harmonious', 'sacred', 'still'],
    'enlightened': ['clear', 'lucid', 'silent', 'boundless', 'pure', 'eternal', 'nondual', 'free', 'aware', 'effortless'],
  };

  final Map<String, List<String>> _nouns = {
    'proverb': ['step', 'decision', 'path', 'time', 'choice', 'tool', 'mind', 'heart', 'lesson', 'journey'],
    'philosophical': ['mind', 'truth', 'idea', 'question', 'thought', 'reality', 'self', 'existence', 'concept', 'belief'],
    'spiritual': ['soul', 'spirit', 'light', 'heart', 'breath', 'presence', 'path', 'voice', 'peace', 'blessing'],
    'enlightened': ['being', 'moment', 'awareness', 'presence', 'truth', 'light', 'path', 'emptiness', 'universe', 'insight'],
  };

  final Map<String, List<String>> _verbs = {
    'proverb': ['wait', 'grow', 'fall', 'learn', 'guide', 'rest', 'act', 'rise', 'start', 'try'],
    'philosophical': ['question', 'ponder', 'perceive', 'know', 'define', 'contemplate', 'reflect', 'challenge', 'accept', 'observe'],
    'spiritual': ['flow', 'meditate', 'rise', 'shine', 'breathe', 'surrender', 'awaken', 'connect', 'align', 'pray'],
    'enlightened': ['realize', 'see', 'dissolve', 'awaken', 'detach', 'merge', 'accept', 'become', 'transform', 'embody'],
  };

  final Random _random = Random();

  String generateWisdom({String level = 'proverb'}) {
    final templates = _templates[level] ?? _templates['proverb']!;
    final template = templates[_random.nextInt(templates.length)];

    return template
      .replaceAll('{adjective}', _getRandomAdjective(level))
      .replaceAll('{noun}', _getRandomNoun(level))
      .replaceAll('{verb}', _getRandomVerb(level));
  }

  String _getRandomAdjective(String level) {
    final adjectives = _adjectives[level] ?? _adjectives['proverb']!;
    return adjectives[_random.nextInt(adjectives.length)];
  }

  String _getRandomNoun(String level) {
    final nouns = _nouns[level] ?? _nouns['proverb']!;
    return nouns[_random.nextInt(nouns.length)];
  }

  String _getRandomVerb(String level) {
    final verbs = _verbs[level] ?? _verbs['proverb']!;
    return verbs[_random.nextInt(verbs.length)];
  }
}
