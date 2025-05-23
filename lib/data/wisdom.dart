import 'dart:math';

class WisdomGenerator {
  final Map<String, List<String>> _templates = {
    'proverb': [
      "A {noun} in time saves nine, but a wise one {verb}s early.",
      "Don't count your {noun}s before they {verb}.",
      "A journey of a thousand {noun}s begins with a single {verb}.",
      "Even a {noun} can {verb} if guided well.",
      "When the {noun} is ready, the {adjective} guide appears.",
      "A {adjective} mind can turn a {noun} into a lesson.",
      "He who {verb}s last, {verb}s best with {adjective} wisdom.",
      "The {noun} that bends does not {verb} in the wind.",
      "A {adjective} {noun} speaks louder than a shout.",
      "You can't {verb} the wind, but you can adjust your {noun}.",
      "Every {noun} has its {adjective} season to {verb}.",
      "Better to {verb} slowly than rush and break the {noun}.",
      "A {noun} without patience cannot {verb} properly.",
      "One who {verb}s often must keep a {adjective} {noun}.",
      "As the {noun} grows, so must your {adjective} {verb}.",
      "Don't let a small {noun} {verb} your entire day.",
      "The {adjective} path often leads the {noun} to {verb}.",
      "To {verb} wisely, one must tame the {adjective} {noun} within.",
      "Even a broken {noun} can {verb} right twice a day.",
      "Wisdom is when you {verb} even though the {noun} is {adjective}.",
      "A {adjective} {noun} never forces the river to {verb}.",
      "The {noun} you avoid will {verb} you in the end.",
      "To {verb} with a {adjective} heart is the greatest {noun}.",
      "No {noun} can {verb} what a {adjective} mind conceals.",
      "The {adjective} way is often hidden behind simple {noun}s.",
      "A {noun} shared is a {verb} multiplied by {adjective} joy.",
      "When you {verb} the {noun}, you master the {adjective} art.",
      "The {adjective} {noun} knows when to speak and when to {verb}.",
      "One {verb} in {adjective} silence is worth a thousand {noun}s.",
      "The {noun} of many {verb}s is a {adjective} treasure.",
      "To {verb} without understanding is to carry an empty {noun}.",
      "A {adjective} {noun} never {verb}s alone in the dark.",
      "The {noun} that {verb}s first often misses the {adjective} truth.",
      "Better a {adjective} {noun} than a {verb} in haste.",
      "When the {noun} {verb}s, the {adjective} mind observes.",
      "A {adjective} decision {verb}s more than a hundred {noun}s.",
      "The {noun} you {verb} today becomes tomorrow's {adjective} lesson.",
      "To {verb} is human, to {verb} {adjective}ly is divine.",
      "No {noun} is too small when {verb}ed with {adjective} care.",
      "The {adjective} {noun} {verb}s where others fear to tread."
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
      "The {adjective} {noun} reveals itself when we stop trying to {verb}.",
      "To {verb} the {noun} is to understand the {adjective} illusion.",
      "A {noun} without context is a {verb} without {adjective} meaning.",
      "The {adjective} paradox is that the {noun} both {verb}s and doesn't.",
      "When you {verb} the {noun}, you become the {adjective} observer.",
      "The {noun} of consciousness is to {verb} beyond {adjective} limits.",
      "To {verb} completely is to dissolve the {adjective} {noun}.",
      "A {adjective} perspective turns every {noun} into a chance to {verb}.",
      "The {noun} we {verb} today shapes the {adjective} reality of tomorrow.",
      "No {adjective} {noun} can {verb} what is inherently unknowable.",
      "The {adjective} mind sees the {noun} but chooses how to {verb}.",
      "To {verb} authentically is to honor the {adjective} {noun} within.",
      "The {noun} of being is to {verb} without attachment to {adjective} outcomes.",
      "A {adjective} {noun} {verb}s in harmony with universal principles.",
      "When the {noun} {verb}s, the {adjective} philosopher observes.",
      "The {adjective} question isn't whether to {verb}, but why the {noun} exists.",
      "To {verb} the {noun} is to participate in {adjective} creation.",
      "A {adjective} understanding {verb}s where logical {noun}s fail.",
      "The {noun} you {verb} today becomes the {adjective} foundation of tomorrow.",
      "True {adjective} wisdom {verb}s beyond the limitations of {noun}s."
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
      "The {adjective} {noun} {verb}s when the mind is silent.",
      "To {verb} deeply is to touch the {adjective} {noun} of existence.",
      "Your {noun} becomes {adjective} when you {verb} with pure intent.",
      "The {adjective} journey begins when you {verb} beyond the {noun}.",
      "A {noun} surrendered is a {verb} transformed by {adjective} will.",
      "When you {verb} as spirit, the {adjective} {noun} appears.",
      "The {adjective} light within {verb}s through every {noun}.",
      "To {verb} in truth is to align with your {adjective} {noun}.",
      "The {noun} you seek is the one that lets your soul {verb}.",
      "A {adjective} heart {verb}s what the {noun} cannot express.",
      "The {adjective} {noun} {verb}s in perfect divine timing.",
      "Your {noun} is a vessel for the {adjective} energy that {verb}s.",
      "To {verb} without resistance is to flow with the {adjective} {noun}.",
      "The {noun} of the spirit {verb}s beyond {adjective} understanding.",
      "A {adjective} {noun} always knows when to {verb} and when to wait.",
      "When you {verb} from the soul, the {adjective} {noun} responds.",
      "The {adjective} path {verb}s through the valley of the {noun}.",
      "Your {noun} becomes sacred when you {verb} with {adjective} awareness.",
      "To {verb} is to participate in the {adjective} dance of the {noun}.",
      "The {adjective} {noun} {verb}s where the mind cannot grasp."
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
      "The {adjective} {noun} {verb}s without doing.",
      "To {verb} enlightenment is to become the {adjective} {noun}.",
      "The {noun} you cling to prevents you from {verb}ing {adjective}ly.",
      "A {adjective} realization {verb}s when the {noun} is seen through.",
      "When you {verb} as awareness, the {adjective} {noun} reveals itself.",
      "The {noun} of separation {verb}s in the light of {adjective} truth.",
      "To {verb} completely is to merge with the {adjective} {noun}.",
      "The {adjective} way is to {verb} without seeking the {noun}.",
      "A {noun} grasped is a {verb} missed in {adjective} presence.",
      "The {adjective} {noun} {verb}s in the space between thoughts.",
      "You are the {adjective} {noun} that {verb}s all experience.",
      "To {verb} freely is to dance as the {adjective} {noun}.",
      "The {noun} you perceive is the {adjective} mirror of how you {verb}.",
      "A {adjective} being {verb}s without the need for {noun}s.",
      "When the {noun} dissolves, what remains is the {adjective} {verb}ing.",
      "The {adjective} path is to {verb} without leaving traces in the {noun}.",
      "True {noun} is when the {adjective} self stops trying to {verb}.",
      "To {verb} enlightenment is to realize there's no {noun} to attain.",
      "The {adjective} {noun} {verb}s in perfect harmony with all that is.",
      "You {verb} the infinite by releasing all concepts of the {noun}."
    ],
  };

  final Map<String, List<String>> _adjectives = {
    'proverb': [
      'wise', 'timely', 'clever', 'humble', 'patient',
      'brave', 'cautious', 'strong', 'gentle', 'alert',
      'prudent', 'shrewd', 'astute', 'discerning', 'perceptive',
      'sagacious', 'judicious', 'thoughtful', 'circumspect', 'deliberate',
      'measured', 'calculated', 'strategic', 'tactful', 'diplomatic',
      'observant', 'attentive', 'vigilant', 'watchful', 'keen',
      'insightful', 'intuitive', 'penetrating', 'sharp', 'quick-witted',
      'sage', 'erudite', 'learned', 'knowledgeable', 'enlightened'
    ],
    'philosophical': [
      'deep', 'existential', 'reflective', 'curious', 'rational',
      'eternal', 'abstract', 'meaningful', 'mental', 'cognitive',
      'metaphysical', 'ontological', 'epistemological', 'logical', 'analytical',
      'speculative', 'contemplative', 'meditative', 'introspective', 'philosophical',
      'theoretical', 'conceptual', 'ideological', 'transcendental', 'universal',
      'fundamental', 'essential', 'profound', 'mystical', 'esoteric',
      'hermeneutic', 'dialectical', 'skeptical', 'stoic', 'socratic',
      'platonic', 'aristotelian', 'kantian', 'nietzschean', 'heideggerian'
    ],
    'spiritual': [
      'divine', 'peaceful', 'graceful', 'centered', 'pure',
      'radiant', 'uplifting', 'harmonious', 'sacred', 'still',
      'holy', 'blessed', 'serene', 'tranquil', 'calm',
      'luminous', 'ethereal', 'celestial', 'angelic', 'heavenly',
      'transcendent', 'mystical', 'enlightened', 'awakened', 'illuminated',
      'sacred', 'reverent', 'devotional', 'prayerful', 'meditative',
      'contemplative', 'mindful', 'present', 'aware', 'conscious',
      'compassionate', 'loving', 'kind', 'merciful', 'forgiving'
    ],
    'enlightened': [
      'clear', 'lucid', 'silent', 'boundless', 'pure',
      'eternal', 'nondual', 'free', 'aware', 'effortless',
      'unattached', 'detached', 'liberated', 'unbound', 'unfettered',
      'unconditioned', 'absolute', 'ultimate', 'supreme', 'perfect',
      'complete', 'whole', 'undivided', 'nonconceptual', 'direct',
      'immediate', 'spontaneous', 'natural', 'uncontrived', 'authentic',
      'true', 'real', 'genuine', 'essential', 'fundamental',
      'primordial', 'original', 'unborn', 'deathless', 'timeless'
    ],
  };

  final Map<String, List<String>> _nouns = {
    'proverb': [
      'step', 'decision', 'path', 'time', 'choice',
      'tool', 'mind', 'heart', 'lesson', 'journey',
      'word', 'action', 'thought', 'hand', 'eye',
      'ear', 'mouth', 'foot', 'road', 'bridge',
      'river', 'mountain', 'valley', 'forest', 'field',
      'seed', 'fruit', 'tree', 'stone', 'water',
      'fire', 'wind', 'earth', 'sky', 'star',
      'sun', 'moon', 'light', 'shadow', 'dawn'
    ],
    'philosophical': [
      'mind', 'truth', 'idea', 'question', 'thought',
      'reality', 'self', 'existence', 'concept', 'belief',
      'theory', 'principle', 'paradox', 'dichotomy', 'duality',
      'consciousness', 'perception', 'knowledge', 'wisdom', 'understanding',
      'reason', 'logic', 'argument', 'premise', 'conclusion',
      'hypothesis', 'thesis', 'antithesis', 'synthesis', 'dialectic',
      'phenomenon', 'noumenon', 'essence', 'substance', 'form',
      'matter', 'spirit', 'being', 'becoming', 'nothingness'
    ],
    'spiritual': [
      'soul', 'spirit', 'light', 'heart', 'breath',
      'presence', 'path', 'voice', 'peace', 'blessing',
      'grace', 'love', 'joy', 'bliss', 'ecstasy',
      'divinity', 'god', 'goddess', 'angel', 'guide',
      'teacher', 'master', 'guru', 'saint', 'mystic',
      'meditation', 'prayer', 'chant', 'mantra', 'yoga',
      'awakening', 'enlightenment', 'nirvana', 'samadhi', 'satori',
      'karma', 'dharma', 'sangha', 'buddha', 'christ'
    ],
    'enlightened': [
      'being', 'moment', 'awareness', 'presence', 'truth',
      'light', 'path', 'emptiness', 'universe', 'insight',
      'realization', 'awakening', 'liberation', 'freedom', 'clarity',
      'silence', 'stillness', 'void', 'suchness', 'isness',
      'thusness', 'now', 'here', 'this', 'that',
      'one', 'all', 'nothing', 'everything', 'infinity',
      'eternity', 'immensity', 'vastness', 'spaciousness', 'openness',
      'transparency', 'lucidity', 'purity', 'simplicity', 'naturalness'
    ],
  };

  final Map<String, List<String>> _verbs = {
    'proverb': [
      'wait', 'grow', 'fall', 'learn', 'guide',
      'rest', 'act', 'rise', 'start', 'try',
      'speak', 'listen', 'see', 'walk', 'run',
      'build', 'plant', 'harvest', 'sow', 'reap',
      'give', 'take', 'hold', 'release', 'bind',
      'loose', 'win', 'lose', 'fight', 'yield',
      'stand', 'sit', 'kneel', 'bow', 'stretch',
      'reach', 'climb', 'descend', 'enter', 'leave'
    ],
    'philosophical': [
      'question', 'ponder', 'perceive', 'know', 'define',
      'contemplate', 'reflect', 'challenge', 'accept', 'observe',
      'analyze', 'synthesize', 'deduce', 'induce', 'reason',
      'argue', 'debate', 'discuss', 'examine', 'investigate',
      'explore', 'discover', 'uncover', 'reveal', 'conceal',
      'understand', 'comprehend', 'grasp', 'apprehend', 'interpret',
      'deconstruct', 'reconstruct', 'transcend', 'mediate', 'mediate',
      'negate', 'affirm', 'doubt', 'believe', 'wonder'
    ],
    'spiritual': [
      'flow', 'meditate', 'rise', 'shine', 'breathe',
      'surrender', 'awaken', 'connect', 'align', 'pray',
      'chant', 'sing', 'dance', 'worship', 'adore',
      'praise', 'thank', 'bless', 'heal', 'transform',
      'transmute', 'purify', 'cleanse', 'release', 'let go',
      'forgive', 'love', 'serve', 'give', 'receive',
      'emanate', 'radiate', 'vibrate', 'resonate', 'attune',
      'harmonize', 'balance', 'center', 'ground', 'ascend'
    ],
    'enlightened': [
      'realize', 'see', 'dissolve', 'awaken', 'detach',
      'merge', 'accept', 'become', 'transform', 'embody',
      'recognize', 'remember', 'know', 'be', 'rest',
      'abide', 'dwell', 'exist', 'appear', 'disappear',
      'vanish', 'manifest', 'unfold', 'expand', 'contract',
      'liberate', 'free', 'release', 'let be', 'allow',
      'surrender', 'trust', 'accept', 'embrace', 'include',
      'transcend', 'go beyond', 'pass through', 'arrive', 'depart'
    ],
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