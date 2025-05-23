import 'dart:math';

class HybridInsultGenerator {
  final Map<String, List<String>> _templates = {
    'mild': [
      "Are you always this {adjective} or is today special?",
      "I'd explain it to you but I don't have any {noun}.",
      "You're about as sharp as a {noun}.",
      "If brains were dynamite, you wouldn't have enough to {verb} a {noun}.",
      "You're not the {adjective} tool in the shed, but you're close.",
      "I'd agree with you but then we'd both be {adjective}.",
      "You bring everyone so much joy... when you {verb} the room.",
      "Your ideas are like a broken {noun}... {adjective}.",
      "Is your name {noun}? Because you lack everything I'm searching for.",
      "You're the reason they put instructions on {noun}.",
      "You're like a {noun} - when you {verb} it's a beautiful day.",
      "I'd call you {adjective} but that would be an insult to {noun}.",
      "You're proof that evolution can {verb} in reverse.",
      "If {noun} was an Olympic sport, you'd still find a way to {verb} it.",
      "You're not {adjective}, you just have bad luck when thinking.",
      "Your {noun} is so {adjective} it could make a {noun} cry.",
      "I've seen {noun} more {adjective} than you.",
      "You're like a {noun}, except without the {adjective} part.",
      "You're not {adjective}, you're {adjective} with extra steps.",
      "The only thing you're good at is being {adjective}.",
      "You're like a {noun} - completely {adjective}.",
      "I'd rather {verb} a {noun} than listen to you.",
      "You're the human equivalent of a {adjective} {noun}.",
      "You're what happens when you {verb} a {noun} too many times.",
      "I'd say you're {adjective} but that would be {adjective}.",
      "You're so {adjective} you make {noun} look good.",
      "If being {adjective} was a crime, you'd be life without parole.",
      "You're like a {noun} - nobody wants you around.",
      "I'd tell you to {verb} but you'd probably {verb} it up.",
      "You're the {adjective} {noun} in the {noun} of life.",
      "You're not just {adjective}, you're {adjective} with a cherry on top.",
      "You're so {adjective} you could {verb} a {noun}.",
      "I'd rather {verb} my {noun} than spend time with you.",
      "You're the reason why {noun} exists.",
      "You're like a {noun} - {adjective} and completely useless.",
      "You're not {adjective}, you're {adjective} in training.",
      "You're the {adjective} {noun} I've ever seen.",
      "You make {noun} look {adjective}.",
      "You're so {adjective} you could {verb} a {noun}.",
      "I'd call you {adjective} but I don't want to insult {noun}.",
    ],
    'medium': [
      "You're the human equivalent of a {adjective} {noun}.",
      "If ignorance is bliss, you must be the {adjective} person alive.",
      "I'd call you a {noun} but that would imply you're {adjective}.",
      "You're like a {noun} - {adjective} and worthless.",
      "Your {noun} is an apology letter from the {noun} factory.",
      "You have the personality of a {adjective} {noun}.",
      "I'd {verb} you but my mom said to be nice to the {adjective}.",
      "You're the reason {noun} won't talk to us.",
      "Did your {noun} ever ask you to {verb} away from home?",
      "You're about as useful as a {adjective} {noun}.",
      "You're so {adjective} light bends around you.",
      "If {noun} was painful, you'd be in constant agony.",
      "You're the {adjective} version of {noun}.",
      "Your {noun} must be a {noun} because everyone on it is a {noun}.",
      "You're like a {noun} - every spot is taken except the {adjective} one.",
      "I'd ask how old you are but I know you can't {verb} that high.",
      "You're the reason some {noun} eat their young.",
      "You're not {adjective}, you're {adjective} with a PhD in {noun}.",
      "You're like a {noun} - nobody wants to deal with you.",
      "You're so {adjective} you could {verb} a {noun} with your {noun}.",
      "I'd rather {verb} a {noun} than acknowledge your existence.",
      "You're the {adjective} {noun} in this {noun} of disappointment.",
      "You're not just {adjective}, you're {adjective} with tenure.",
      "You're like a {noun} - the more time passes, the more {adjective} you become.",
      "You're so {adjective} you could {verb} a {noun} just by standing there.",
      "I'd call you {adjective} but that would require me to care.",
      "You're the {adjective} {noun} in this {noun} of misery.",
      "You're not {adjective}, you're {adjective} with a lifetime achievement award.",
      "You're like a {noun} - everyone hopes you'll {verb} soon.",
      "You're so {adjective} you could {verb} a {noun} with your {noun}.",
      "I'd rather {verb} a {noun} than be seen with you.",
      "You're the {adjective} {noun} I've ever had the misfortune to meet.",
      "You're not {adjective}, you're {adjective} with a fan club of {noun}.",
      "You're like a {noun} - the world would be better without you.",
      "You're so {adjective} you could {verb} a {noun} by accident.",
      "I'd call you {adjective} but I don't want to waste the breath.",
      "You're the {adjective} {noun} in this {noun} of despair.",
      "You're not {adjective}, you're {adjective} with a following of {noun}.",
      "You're like a {noun} - actively making things worse.",
    ],
    'spicy': [
      "Scientists say the universe is made of {noun}... they forgot to mention you.",
      "You're proof {noun} can go backwards.",
      "I'd {verb} you but that would be {noun} abuse.",
      "You're so {adjective} light bends around you.",
      "If {noun} was painful, you'd be in constant agony.",
      "You're the human version of {adjective} {noun}.",
      "Your {noun} must be a {noun} because everyone on it is a {noun}.",
      "You're like a {noun} - every spot is taken except the {adjective} one.",
      "I'd ask how old you are but I know you can't {verb} that high.",
      "You're the reason some {noun} eat their young.",
      "You're not just {adjective}, you're {adjective} with a side of {noun}.",
      "You're like a {noun} - the more you {verb}, the worse it gets.",
      "You're so {adjective} you could {verb} a {noun} with your {noun}.",
      "I'd rather {verb} a {noun} than acknowledge your {noun}.",
      "You're the {adjective} {noun} in this {noun} of disappointment.",
      "You're not {adjective}, you're {adjective} with a PhD in {noun}.",
      "You're like a {noun} - the more time passes, the more {adjective} you become.",
      "You're so {adjective} you could {verb} a {noun} just by standing there.",
      "I'd call you {adjective} but that would require me to care about your {noun}.",
      "You're the {adjective} {noun} in this {noun} of misery.",
      "You're not {adjective}, you're {adjective} with a lifetime achievement award in {noun}.",
      "You're like a {noun} - everyone hopes you'll {verb} soon.",
      "You're so {adjective} you could {verb} a {noun} with your {noun}.",
      "I'd rather {verb} a {noun} than be seen with your {noun}.",
      "You're the {adjective} {noun} I've ever had the misfortune to {verb}.",
      "You're not {adjective}, you're {adjective} with a fan club of {noun}.",
      "You're like a {noun} - the world would {verb} better without you.",
      "You're so {adjective} you could {verb} a {noun} by accident.",
      "I'd call you {adjective} but I don't want to waste my {noun}.",
      "You're the {adjective} {noun} in this {noun} of despair.",
      "You're not {adjective}, you're {adjective} with a following of {noun}.",
      "You're like a {noun} - actively making the {noun} worse.",
      "You're so {adjective} you could {verb} a {noun} without trying.",
      "I'd rather {verb} a {noun} than hear your {noun}.",
      "You're the {adjective} {noun} in this {noun} of regret.",
      "You're not {adjective}, you're {adjective} with a documentary about your {noun}.",
      "You're like a {noun} - a cautionary tale about {noun}.",
      "You're so {adjective} you could {verb} a {noun} in your sleep.",
      "I'd call you {adjective} but that would imply I think about your {noun}.",
      "You're the {adjective} {noun} in this {noun} of shame.",
    ],
    'nuclear': [
      "Your existence is proof that {noun} can {verb} horribly wrong.",
      "If {noun} was a person, it would {verb} itself to avoid being you.",
      "You're what happens when {noun} and {noun} love each other very, very wrong.",
      "I'd say you're {adjective} but that would insult actual {noun}.",
      "You're the {adjective} {noun} that ever {verb} the {noun}.",
      "Your {noun} is so {adjective} it could {verb} a {noun} at 50 paces.",
      "You're like a {noun} - if the {noun} was made of {adjective} {noun}.",
      "I'd rather {verb} a {noun} with my {noun} than spend time with you.",
      "You're the reason why {noun} drink.",
      "You're not just {adjective}, you're a {adjective} {noun} of {adjective} {noun}.",
      "You're what happens when {noun} and {noun} have a {adjective} baby.",
      "If {noun} was a crime, you'd be sentenced to {verb} for eternity.",
      "You're the {adjective} {noun} that ever {verb} this {noun}.",
      "Your {noun} is so {adjective} it could {verb} a {noun} just by existing.",
      "You're like a {noun} designed by a committee of {adjective} {noun}.",
      "I'd rather {verb} my {noun} with a {noun} than listen to you.",
      "You're the reason {noun} invented the concept of {noun}.",
      "You're not just {adjective}, you're a {adjective} {noun} in a {noun} suit.",
      "You're what you get when you {verb} a {noun} with a {noun}.",
      "If {noun} was currency, you'd be worth less than a {adjective} {noun}.",
      "You're the {adjective} {noun} that ever {verb} this side of a {noun}.",
      "Your {noun} is so {adjective} it could {verb} a {noun} through a wall.",
      "You're like a {noun} built by {adjective} {noun} on a {adjective} day.",
      "I'd rather {verb} a {noun} with my bare {noun} than be near you.",
      "You're the reason why {noun} have trust issues.",
      "You're not just {adjective}, you're a {adjective} {noun} of epic proportions.",
      "You're what happens when you {verb} a {noun} into a {noun}.",
      "If {noun} was art, you'd be the {adjective} {noun} in the museum.",
      "You're the {adjective} {noun} that ever {verb} this {noun} of existence.",
      "Your {noun} is so {adjective} it could {verb} a {noun} at a glance.",
      "You're like a {noun} designed to {verb} the {noun} of all who see it.",
      "I'd rather {verb} my {noun} with a rusty {noun} than hear you speak.",
      "You're the reason why {noun} question their life choices.",
      "You're not just {adjective}, you're a {adjective} {noun} of biblical proportions.",
      "You're what happens when a {noun} and a {noun} hate each other very much.",
      "If {noun} was music, you'd be the {adjective} {noun} ever composed.",
      "You're the {adjective} {noun} that ever {verb} this plane of reality.",
      "Your {noun} is so {adjective} it could {verb} a {noun} from orbit.",
      "You're like a {noun} that {verb} the very concept of {noun}.",
      "I'd rather {verb} my {noun} with a {adjective} {noun} than acknowledge you.",
    ],
  };
  
  final Map<String, List<String>> _adjectives = {
    'mild': [
      'slow', 'confused', 'lost', 'dull', 'simple', 
      'basic', 'naive', 'gullible', 'clumsy', 'awkward',
      'silly', 'foolish', 'absent-minded', 'spacey', 'dim',
      'vague', 'unfocused', 'scatterbrained', 'forgetful', 'oblivious',
      'dense', 'thick', 'slow-witted', 'dim-witted', 'simple-minded',
      'unobservant', 'inattentive', 'undiscerning', 'unperceptive', 'uncomprehending',
      'unintelligent', 'brainless', 'mindless', 'witless', 'empty-headed',
      'vacant', 'blank', 'unthinking', 'unreflective', 'shallow'
    ],
    'medium': [
      'dense', 'clueless', 'irritating', 'obnoxious', 'insufferable',
      'annoying', 'frustrating', 'incompetent', 'useless', 'hopeless',
      'pathetic', 'ridiculous', 'embarrassing', 'cringeworthy', 'painful',
      'aggravating', 'exasperating', 'infuriating', 'maddening', 'vexing',
      'bothersome', 'tiresome', 'wearisome', 'tedious', 'monotonous',
      'unbearable', 'unendurable', 'intolerable', 'insupportable', 'oppressive',
      'repellent', 'repugnant', 'disagreeable', 'unpleasant', 'displeasing',
      'distasteful', 'offensive', 'objectionable', 'disgusting', 'repulsive'
    ],
    'spicy': [
      'brainless', 'worthless', 'pathetic', 'disgusting', 'repulsive',
      'vile', 'deplorable', 'contemptible', 'despicable', 'loathsome',
      'abhorrent', 'revolting', 'nauseating', 'offensive', 'insulting',
      'detestable', 'odious', 'execrable', 'abominable', 'heinous',
      'atrocious', 'monstrous', 'villainous', 'diabolical', 'fiendish',
      'satanic', 'hellish', 'infernal', 'damned', 'accursed',
      'wretched', 'miserable', 'pitiful', 'lamentable', 'sorry',
      'wretched', 'sorry', 'pitiable', 'deplorable', 'wretched'
    ],
    'nuclear': [
      'subhuman', 'wretched', 'execrable', 'abominable', 'detestable',
      'odious', 'heinous', 'atrocious', 'monstrous', 'villainous',
      'diabolical', 'satanic', 'hellish', 'damned', 'accursed',
      'unholy', 'blasphemous', 'sacrilegious', 'profane', 'impious',
      'godforsaken', 'forsaken', 'abandoned', 'desolate', 'wretched',
      'putrid', 'festering', 'rotten', 'decaying', 'decomposing',
      'pestilential', 'noxious', 'toxic', 'poisonous', 'venomous',
      'malignant', 'virulent', 'pernicious', 'baneful', 'destructive'
    ]
  };
  
  final Map<String, List<String>> _nouns = {
    'mild': [
      'crayons', 'time', 'patience', 'marble', 'rock',
      'spoon', 'doorknob', 'potato', 'blanket', 'pillow',
      'sock', 'shoe', 'hat', 'glove', 'stick',
      'pebble', 'twig', 'leaf', 'cloud', 'raindrop',
      'snowflake', 'dust bunny', 'paperclip', 'rubber band', 'bubble',
      'shadow', 'echo', 'mirage', 'daydream', 'afterthought',
      'misfit', 'oddball', 'square peg', 'round hole', 'mismatch',
      'nonentity', 'nobody', 'nothing', 'zero', 'void'
    ],
    'medium': [
      'brick', 'dumpster fire', 'trainwreck', 'disaster', 'joke',
      'failure', 'waste', 'disappointment', 'embarrassment', 'catastrophe',
      'tragedy', 'fiasco', 'mess', 'screw-up', 'letdown',
      'debacle', 'flop', 'washout', 'has-been', 'never-was',
      'loser', 'dud', 'bust', 'flunk', 'misfire',
      'miscalculation', 'misstep', 'blunder', 'gaffe', 'faux pas',
      'botch', 'bungle', 'foul-up', 'snafu', 'clusterfuck',
      'shitshow', 'circus', 'farce', 'charade', 'mockery'
    ],
    'spicy': [
      'dumpster baby', 'garbage person', 'waste of space', 'oxygen thief',
      'disgrace', 'abomination', 'monstrosity', 'failure of nature',
      'genetic mistake', 'evolutionary dead end', 'cosmic joke',
      'universal disappointment', 'planetary embarrassment', 'galactic shame',
      'interstellar joke', 'black hole of talent', 'void of competence',
      'singularity of stupidity', 'event horizon of intelligence',
      'quantum fluctuation of worth', 'dark matter of personality',
      'neutron star of density', 'supernova of failure', 'big bang of disappointment',
      'cosmic background radiation of incompetence', 'asteroid belt of failure',
      'meteor shower of shame', 'solar flare of embarrassment',
      'lunar eclipse of talent', 'planetary alignment of misfortune',
      'wormhole of despair', 'quasar of pity', 'pulsar of regret',
      'nebula of sorrow', 'supercluster of shame', 'dark energy of failure',
      'gravitational wave of disappointment', 'event horizon of competence',
      'accretion disk of failure', 'protostar of potential wasted'
    ],
    'nuclear': [
      'festering pustule', 'sentient tumor', 'walking abortion',
      'failed abortion', 'biological hazard', 'toxic waste dump',
      'nuclear disaster', 'war crime', 'crime against humanity',
      'sin against nature', 'blight upon existence', 'cosmic horror',
      'eldritch abomination', 'lovecraftian nightmare', 'cthulhic mistake',
      'yog-sothothian error', 'azathothic blunder', 'shub-niggurathian failure',
      'nyarlathotepian joke', 'dagonian disappointment', 'deep one hybrid',
      'mi-go experiment', 'great old one reject', 'outer god castoff',
      'dimensional shambler', 'void spawn', 'abyssal wretch', 'netherworld reject',
      'infernal mistake', 'pandimensional garbage', 'omniversal eyesore',
      'multiversal stain', 'quantum defect', 'reality tumor', 'existence error',
      'cosmic typo', 'universal glitch', 'dimensional anomaly', 'temporal paradox',
      'reality cancer'
    ]
  };

  final Map<String, List<String>> _verbs = {
    'mild': [
      'blow', 'tickle', 'confuse', 'amuse', 'entertain',
      'distract', 'baffle', 'bewilder', 'perplex', 'mystify',
      'fluster', 'rattle', 'discombobulate', 'flummox', 'nonplus',
      'confound', 'disconcert', 'unsettle', 'perturb', 'agitate',
      'discompose', 'disquiet', 'unnerve', 'unhinge', 'derange',
      'unbalance', 'disorient', 'muddle', 'befuddle', 'addle',
      'fuddle', 'stupefy', 'dumbfound', 'stump', 'puzzle',
      'bemuse', 'mislead', 'delude', 'hoodwink', 'bamboozle'
    ],
    'medium': [
      'annoy', 'irritate', 'infuriate', 'enrage', 'disgust',
      'repulse', 'offend', 'insult', 'outrage', 'appall',
      'horrify', 'mortify', 'scandalize', 'shock', 'revolt',
      'nauseate', 'sicken', 'repel', 'displease', 'disturb',
      'aggravate', 'exasperate', 'provoke', 'gall', 'rankle',
      'chafe', 'fret', 'vex', 'peeve', 'pique',
      'rile', 'nettle', 'needle', 'harass', 'badger',
      'hound', 'plague', 'torment', 'bedevil', 'beleaguer'
    ],
    'spicy': [
      'vomit', 'retch', 'gag', 'cringe', 'wince',
      'shudder', 'recoil', 'flinch', 'quail', 'tremble',
      'quiver', 'shake', 'convulse', 'twitch', 'spasm',
      'writhe', 'squirm', 'cower', 'crawl', 'grovel',
      'prostrate', 'debase', 'degrade', 'humiliate', 'demean',
      'disgrace', 'shame', 'mortify', 'abase', 'belittle',
      'diminish', 'deprecate', 'deride', 'mock', 'ridicule',
      'scorn', 'disparage', 'denigrate', 'depreciate', 'vilify'
    ],
    'nuclear': [
      'disintegrate', 'vaporize', 'annihilate', 'obliterate', 'eradicate',
      'expunge', 'extinguish', 'terminate', 'exterminate', 'liquidate',
      'decimate', 'destroy', 'demolish', 'devastate', 'raze',
      'level', 'flatten', 'pulverize', 'shatter', 'smash',
      'crush', 'grind', 'atomize', 'ionize', 'plasmafy',
      'singularitize', 'blackhole', 'entropy', 'nullify', 'void',
      'uncreate', 'unmake', 'erase', 'delete', 'cancel',
      'neutralize', 'invalidate', 'abrogate', 'revoke', 'rescind'
    ]
  };

  final Random _random = Random();

  String generateInsult({String level = 'mild'}) {
    final templates = _templates[level] ?? _templates['mild']!;
    final template = templates[_random.nextInt(templates.length)];
    
    return template
      .replaceAll('{adjective}', _getRandomAdjective(level))
      .replaceAll('{noun}', _getRandomNoun(level))
      .replaceAll('{verb}', _getRandomVerb(level));
  }

  String _getRandomAdjective(String level) {
    final adjectives = _adjectives[level] ?? _adjectives['mild']!;
    return adjectives[_random.nextInt(adjectives.length)];
  }
  
  String _getRandomNoun(String level) {
    final nouns = _nouns[level] ?? _nouns['mild']!;
    return nouns[_random.nextInt(nouns.length)];
  }

  String _getRandomVerb(String level) {
    final verbs = _verbs[level] ?? _verbs['mild']!;
    return verbs[_random.nextInt(verbs.length)];
  }
}