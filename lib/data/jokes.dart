import 'dart:math';

class JokeGenerator {
  final Map<String, List<String>> _templates = {
    'dad': [
      "Why did the {noun} {verb}? Because it was {adjective}!",
      "I told my {noun} to {verb} but it just stayed {adjective}.",
      "That {adjective} {noun} sure knows how to {verb}!",
      "Don't be a {noun}, just {verb} like a {adjective} dad.",
      "I'm not lazy, I'm just {adjective} like a {noun} trying to {verb}.",
      "You can't {verb} a {adjective} {noun}, but you can try!",
      "That {noun} {verb}s better than your {adjective} jokes.",
      "If a {adjective} {noun} could {verb}, it'd be me.",
      "My {noun} is so {adjective}, it won't {verb} for you.",
      "What's {adjective}, smells like a {noun} and loves to {verb}? Dad jokes!",
      "I'm so {adjective}, even my {noun} tries to {verb}.",
      "Why did the {noun} {verb}? To get to the {adjective} side.",
      "A {adjective} {noun} never forgets to {verb} on time.",
      "Keep your {noun} {adjective} and just {verb}.",
      "The secret to being a {adjective} dad is to {verb} like a {noun}.",
      "I told my {noun} to be {adjective} and {verb} quietly.",
      "If {noun}s could talk, they'd say, '{verb} more {adjective}!'.",
      "Nothing is more {adjective} than a {noun} trying to {verb}.",
      "You can't teach a {noun} to {verb}, but you can make it {adjective}.",
      "My {noun} loves to {verb} when it's feeling {adjective}.",
      "A {adjective} dad's favorite {noun} always knows how to {verb}.",
      "When life gives you {noun}s, make {adjective} jokes and {verb}.",
      "The early {noun} gets the {adjective} joke and {verb}s first.",
      "You can lead a {noun} to water, but you can't make it {verb} {adjective}ly.",
      "My {noun} is so {adjective}, it {verb}s in its sleep.",
      "Why don't {noun}s ever {verb}? Because they're too {adjective}!",
      "That {adjective} {noun} {verb}ed so hard it became a dad joke.",
      "If you {verb} a {noun} {adjective}ly, is it still funny?",
      "The {adjective}er the {noun}, the harder it {verb}s.",
      "My {noun} tried to {verb} but ended up {adjective} instead.",
      "A {adjective} {noun} walks into a bar... and {verb}s immediately.",
      "You know you're {adjective} when your {noun} starts to {verb}.",
      "The {adjective} {noun} that {verb}s together stays together.",
      "Never {verb} a {adjective} {noun} unless you're prepared for puns.",
      "My {noun} is {adjective} proof that dad jokes {verb}.",
      "Why did the {adjective} {noun} cross the road? To {verb} of course!",
      "You're not really {adjective} until your {noun} {verb}s spontaneously.",
      "The {noun} was so {adjective}, it {verb}ed uncontrollably.",
      "A {adjective} {noun} a day keeps the {verb}ing away.",
      "When in doubt, {verb} like a {adjective} {noun}.",
    ],
    'knock-knock': [
      "Knock knock. Who's there? A {adjective} {noun} who loves to {verb}.",
      "Knock knock. Who's there? A {noun} that won't {verb}.",
      "Knock knock. Who's there? Your {adjective} {noun} ready to {verb}.",
      "Knock knock. Who's there? The {adjective} {noun} who can't {verb}.",
      "Knock knock. Who's there? A {noun} trying to {verb} {adjective}ly.",
      "Knock knock. Who's there? The {adjective} {noun} who likes to {verb}.",
      "Knock knock. Who's there? A {noun} so {adjective} it {verb}s all day.",
      "Knock knock. Who's there? The {adjective} {noun} with no {noun} to {verb}.",
      "Knock knock. Who's there? A {noun} that will {verb} when {adjective}.",
      "Knock knock. Who's there? The {adjective} {noun} knocking to {verb}.",
      "Knock knock. Who's there? A {noun} that never {verb}s, but is {adjective}.",
      "Knock knock. Who's there? The {adjective} {noun} ready to {verb} again.",
      "Knock knock. Who's there? A {noun} that makes you {verb} {adjective}ly.",
      "Knock knock. Who's there? The {adjective} {noun} who forgot to {verb}.",
      "Knock knock. Who's there? A {noun} trying to {verb} with {adjective} style.",
      "Knock knock. Who's there? The {adjective} {noun} who loves to {verb}.",
      "Knock knock. Who's there? A {noun} {verb}ing in a {adjective} mood.",
      "Knock knock. Who's there? The {adjective} {noun} who never stops {verb}ing.",
      "Knock knock. Who's there? A {noun} that will {verb} until {adjective}.",
      "Knock knock. Who's there? The {adjective} {noun} with a plan to {verb}.",
      "Knock knock. Who's there? A {adjective} {noun} who {verb}s at midnight.",
      "Knock knock. Who's there? The {noun} that {verb}s {adjective}ly at parties.",
      "Knock knock. Who's there? Your {adjective} {noun} here to {verb} the show.",
      "Knock knock. Who's there? The {noun} who {verb}s {adjective}ly under pressure.",
      "Knock knock. Who's there? A {adjective} {noun} who {verb}s for attention.",
      "Knock knock. Who's there? The {noun} that {verb}s when you're {adjective}.",
      "Knock knock. Who's there? A {adjective} {noun} who {verb}s in Morse code.",
      "Knock knock. Who's there? The {noun} that {verb}s {adjective}ly in reverse.",
      "Knock knock. Who's there? A {adjective} {noun} who {verb}s in iambic pentameter.",
      "Knock knock. Who's there? The {noun} that {verb}s only on {adjective} days.",
      "Knock knock. Who's there? A {adjective} {noun} who {verb}s while standing on one foot.",
      "Knock knock. Who's there? The {noun} that {verb}s {adjective}ly in Latin.",
      "Knock knock. Who's there? A {adjective} {noun} who {verb}s in perfect harmony.",
      "Knock knock. Who's there? The {noun} that {verb}s {adjective}ly at full moon.",
      "Knock knock. Who's there? A {adjective} {noun} who {verb}s while wearing a disguise.",
      "Knock knock. Who's there? The {noun} that {verb}s {adjective}ly in binary.",
      "Knock knock. Who's there? A {adjective} {noun} who {verb}s in alphabetical order.",
      "Knock knock. Who's there? The {noun} that {verb}s {adjective}ly while juggling.",
      "Knock knock. Who's there? A {adjective} {noun} who {verb}s standing on their head.",
      "Knock knock. Who's there? The {noun} that {verb}s {adjective}ly in pig Latin.",
    ],
    'one-liner': [
      "I was so {adjective}, I tried to {verb} a {noun}.",
      "If life gives you {noun}s, just {verb} {adjective}ly.",
      "Never trust a {adjective} {noun} that can't {verb}.",
      "The secret to being {adjective} is to {verb} like a {noun}.",
      "I once saw a {noun} that was too {adjective} to {verb}.",
      "Why {verb} when you can be {adjective} like a {noun}?",
      "My {noun} is {adjective}, but it still knows how to {verb}.",
      "You {verb} better when you're {adjective} than a {noun}.",
      "A {adjective} {noun} will always {verb} at the right time.",
      "They say a {noun} that {verb}s is {adjective} indeed.",
      "I can't {verb} a {adjective} {noun} if my life depended on it.",
      "Being {adjective} means you never stop {verb}ing a {noun}.",
      "I found a {adjective} {noun} that loves to {verb} all day.",
      "Why be {adjective} when you can {verb} like a {noun}?",
      "The {noun} was so {adjective}, it wouldn't {verb} for anyone.",
      "You can't {verb} without a {adjective} {noun} by your side.",
      "Life is better when you {verb} with a {adjective} {noun}.",
      "That {adjective} {noun} taught me how to {verb} properly.",
      "Sometimes, a {noun} just needs to {verb} to feel {adjective}.",
      "I told the {adjective} {noun} to {verb} before it was too late.",
      "A {adjective} {noun} walks into a bar and {verb}s immediately.",
      "The {adjective}er the {noun}, the harder it {verb}s.",
      "You know you're {adjective} when your {noun} starts to {verb}.",
      "Never {verb} a {adjective} {noun} unless you want consequences.",
      "My {noun} is so {adjective}, it {verb}s in its sleep.",
      "Why don't {noun}s ever {verb}? Because they're too {adjective}!",
      "That {adjective} {noun} {verb}ed so hard it became legendary.",
      "If you {verb} a {noun} {adjective}ly, is it still effective?",
      "The {adjective} {noun} that {verb}s together stays together.",
      "My {noun} is {adjective} proof that one-liners {verb}.",
      "Why did the {adjective} {noun} cross the road? To {verb} obviously!",
      "You're not really {adjective} until your {noun} {verb}s spontaneously.",
      "The {noun} was so {adjective}, it {verb}ed uncontrollably.",
      "A {adjective} {noun} a day keeps the {verb}ing away.",
      "When in doubt, {verb} like a {adjective} {noun} would.",
      "The early {noun} gets the {adjective} {verb}.",
      "You can lead a {noun} to water, but you can't make it {verb} {adjective}ly.",
      "My {noun} tried to {verb} but ended up {adjective} instead.",
      "That {adjective} {noun} {verb}s better than it has any right to.",
      "Nothing is more {adjective} than a {noun} that won't {verb}.",
    ],
    'dark': [
      "The {adjective} {noun} will {verb} when no one's watching.",
      "Don't let that {noun} {verb} your {adjective} soul.",
      "In the shadows, the {adjective} {noun} loves to {verb}.",
      "A {noun} {verb}ing in the dark is more {adjective} than you think.",
      "Your {adjective} {noun} hides a secret it won't {verb}.",
      "When the {noun} {verb}s, the {adjective} truth is revealed.",
      "That {adjective} {noun} is waiting to {verb} your hopes.",
      "The {noun} knows how to {verb} with {adjective} intent.",
      "Don't trust the {adjective} {noun} that won't {verb} back.",
      "Sometimes the {noun} that {verb}s the hardest is the most {adjective}.",
      "A {adjective} {noun} {verb}s while the world sleeps.",
      "The {noun} you fear is more {adjective} than you can {verb}.",
      "When the {adjective} {noun} {verb}s, all bets are off.",
      "Your {noun} is a {adjective} {verb} waiting to happen.",
      "The {adjective} {noun} {verb}s in the silence of the night.",
      "Even the {noun} knows to {verb} when things get {adjective}.",
      "Behind every {adjective} {noun} is a {verb} you never saw coming.",
      "The {noun} that {verb}s alone is the most {adjective}.",
      "When the {adjective} {noun} {verb}s, no one is safe.",
      "You think you're safe until the {noun} starts to {verb} with {adjective} purpose.",
      "The {adjective} {noun} {verb}s where no light can reach.",
      "Your {noun} remembers every {adjective} thing it has {verb}ed.",
      "A {adjective} {noun} never {verb}s without leaving traces.",
      "The {noun} under your bed {verb}s more {adjective} than you know.",
      "That {adjective} {noun} isn't really {verb}ing - it's watching.",
      "When the clock strikes midnight, the {noun} begins to {verb} {adjective}ly.",
      "Your reflection {verb}s differently when the {adjective} {noun} appears.",
      "The {noun} in the mirror {verb}s when you're too {adjective} to notice.",
      "A {adjective} {noun} {verb}s in patterns only the dead understand.",
      "Your shadow isn't yours - it's the {adjective} {noun} that {verb}s.",
      "The {adjective} {noun} {verb}s where children once played.",
      "Your {noun} isn't where you left it - something {adjective} has {verb}ed it.",
      "The {adjective} {noun} {verb}s in languages never spoken.",
      "Your {noun} {verb}s differently when the {adjective} presence is near.",
      "The {adjective} {noun} marks its prey before they {verb}.",
      "Your heartbeat syncs with the {adjective} {noun}'s {verb}ing.",
      "The {adjective} {noun} {verb}s your name in empty rooms.",
      "Every step you take makes the {adjective} {noun} {verb} louder.",
      "Your sanity unravels as the {adjective} {noun} {verb}s.",
      "The {adjective} {noun} {verb}s where shadows are deepest.",
    ],
  };

  final Map<String, List<String>> _adjectives = {
    'dad': [
      'funny', 'corny', 'cheesy', 'goofy', 'punny',
      'silly', 'lame', 'cringy', 'witty', 'cornball',
      'dorky', 'nerdy', 'quirky', 'wholesome', 'awkward',
      'embarrassing', 'predictable', 'repetitive', 'formulaic', 'unoriginal',
      'classic', 'timeless', 'recycled', 'tired', 'exhausted',
      'groan-worthy', 'eye-rolling', 'face-palming', 'nostalgic', 'retro',
      'old-school', 'traditional', 'conventional', 'safe', 'mild',
      'inoffensive', 'family-friendly', 'clean', 'wholesome', 'dad-approved'
    ],
    'knock-knock': [
      'knock-knock', 'funny', 'silly', 'witty', 'corny',
      'classic', 'punny', 'cheesy', 'quirky', 'lame',
      'predictable', 'formulaic', 'repetitive', 'annoying', 'persistent',
      'loud', 'quiet', 'shy', 'bold', 'confident',
      'hesitant', 'eager', 'reluctant', 'enthusiastic', 'apathetic',
      'energetic', 'tired', 'sleepy', 'awake', 'alert',
      'confused', 'clear', 'mysterious', 'obvious', 'subtle',
      'direct', 'indirect', 'roundabout', 'straightforward', 'complicated'
    ],
    'one-liner': [
      'quick', 'sharp', 'dry', 'witty', 'sarcastic',
      'clever', 'bold', 'snappy', 'punchy', 'snarky',
      'biting', 'cutting', 'acerbic', 'pointed', 'incisive',
      'keen', 'astute', 'perceptive', 'discerning', 'shrewd',
      'sardonic', 'ironic', 'satirical', 'mocking', 'taunting',
      'provocative', 'thought-provoking', 'stimulating', 'challenging', 'controversial',
      'edgy', 'risky', 'daring', 'audacious', 'brazen',
      'unapologetic', 'blunt', 'forthright', 'candid', 'frank'
    ],
    'dark': [
      'creepy', 'spooky', 'eerie', 'sinister', 'grim',
      'morbid', 'twisted', 'ghastly', 'haunting', 'shadowy',
      'macabre', 'grotesque', 'ghoulish', 'chilling', 'unnerving',
      'disturbing', 'unsettling', 'disquieting', 'alarming', 'frightening',
      'terrifying', 'horrifying', 'petrifying', 'bloodcurdling', 'bone-chilling',
      'nightmarish', 'harrowing', 'traumatic', 'devastating', 'soul-crushing',
      'hopeless', 'bleak', 'dismal', 'forlorn', 'desolate',
      'abandoned', 'forsaken', 'isolated', 'lonely', 'hollow'
    ],
  };

  final Map<String, List<String>> _nouns = {
    'dad': [
      'joke', 'pun', 'dad', 'beard', 'grill',
      'lawnmower', 'barbecue', 'toolbox', 'sock', 'sandwich',
      'mustache', 'flip-flops', 'newspaper', 'remote', 'recliner',
      'garage', 'workbench', 'thermos', 'lunchbox', 'minivan',
      'casserole', 'cookout', 'picnic', 'fishing pole', 'golf clubs',
      'cardigan', 'suspenders', 'bowtie', 'apron', 'slippers',
      'new balance shoes', 'fanny pack', 'fishing hat', 'cargo shorts', 'white socks',
      'dad bod', 'dad jokes', 'dad energy', 'dad vibes', 'dad life'
    ],
    'knock-knock': [
      'door', 'who', 'joke', 'visitor', 'friend',
      'stranger', 'ghost', 'knocker', 'neighbor', 'puppy',
      'salesman', 'pizza guy', 'mailman', 'girl scout', 'trick-or-treater',
      'avon lady', 'jehovah\'s witness', 'solicitor', 'unexpected guest', 'long-lost relative',
      'ex', 'landlord', 'police', 'fireman', 'paramedic',
      'plumber', 'electrician', 'cable guy', 'meter reader', 'census taker',
      'process server', 'bail bondsman', 'repo man', 'amazon driver', 'fedex guy',
      'ups guy', 'food delivery', 'flower delivery', 'singing telegram', 'stripper gram'
    ],
    'one-liner': [
      'quip', 'line', 'punchline', 'zinger', 'comedy',
      'wit', 'quipster', 'comedian', 'snark', 'remark',
      'observation', 'insight', 'perspective', 'take', 'angle',
      'viewpoint', 'stance', 'position', 'declaration', 'pronouncement',
      'statement', 'assertion', 'comment', 'aside', 'interjection',
      'retort', 'rejoinder', 'riposte', 'counter', 'comeback',
      'clapback', 'burn', 'diss', 'roast', 'slam',
      'dig', 'barb', 'gibe', 'taunt', 'jeer'
    ],
    'dark': [
      'shadow', 'ghost', 'night', 'grave', 'skull',
      'monster', 'death', 'darkness', 'scream', 'void',
      'corpse', 'coffin', 'tombstone', 'crypt', 'mausoleum',
      'funeral', 'wake', 'obituary', 'eulogy', 'last rites',
      'suicide', 'murder', 'accident', 'tragedy', 'disaster',
      'cataclysm', 'apocalypse', 'armageddon', 'doomsday', 'extinction',
      'abyss', 'chasm', 'abandonment', 'despair', 'anguish',
      'agony', 'torment', 'suffering', 'misery', 'wretchedness'
    ],
  };

  final Map<String, List<String>> _verbs = {
    'dad': [
      'grill', 'mow', 'fix', 'joke', 'laugh',
      'pun', 'grumble', 'snore', 'cook', 'nap',
      'complain', 'lecture', 'tease', 'embarrass', 'chuckle',
      'sigh', 'yawn', 'stretch', 'scratch', 'belch',
      'fart', 'snort', 'guffaw', 'chortle', 'wheeze',
      'tinker', 'putter', 'piddle', 'doodle', 'fiddle',
      'tinker', 'adjust', 'tighten', 'loosen', 'oil',
      'grease', 'clean', 'organize', 'rearrange', 'supervise'
    ],
    'knock-knock': [
      'knock', 'answer', 'open', 'laugh', 'wait',
      'listen', 'shout', 'hide', 'sneak', 'call',
      'ignore', 'pretend', 'hesitate', 'delay', 'rush',
      'panic', 'freeze', 'flee', 'investigate', 'peer',
      'peek', 'glimpse', 'stare', 'gape', 'gawk',
      'observe', 'watch', 'study', 'examine', 'inspect',
      'consider', 'ponder', 'contemplate', 'deliberate', 'debate',
      'question', 'interrogate', 'query', 'inquire', 'ask'
    ],
    'one-liner': [
      'cut', 'burn', 'drop', 'hit', 'fire',
      'snap', 'deliver', 'roast', 'poke', 'strike',
      'land', 'execute', 'perform', 'utter', 'declare',
      'proclaim', 'announce', 'state', 'pronounce', 'assert',
      'affirm', 'aver', 'avow', 'maintain', 'insist',
      'contend', 'argue', 'claim', 'profess', 'allege',
      'suggest', 'imply', 'hint', 'insinuate', 'intimate',
      'indicate', 'signal', 'gesture', 'motion', 'beckon'
    ],
    'dark': [
      'creep', 'haunt', 'lurk', 'whisper', 'scream',
      'fade', 'bleed', 'stalk', 'shatter', 'wail',
      'moan', 'groan', 'howl', 'shriek', 'screech',
      'growl', 'hiss', 'snarl', 'spit', 'vomit',
      'decay', 'rot', 'fester', 'putrefy', 'decompose',
      'disintegrate', 'crumble', 'dissolve', 'melt', 'wither',
      'shrivel', 'wilt', 'atrophy', 'degenerate', 'deteriorate',
      'corrode', 'erode', 'consume', 'devour', 'absorb'
    ],
  };

  final Random _random = Random();

  String generateJoke({String level = 'dad'}) {
    final templates = _templates[level] ?? _templates['dad']!;
    final template = templates[_random.nextInt(templates.length)];

    return template
      .replaceAll('{adjective}', _getRandomAdjective(level))
      .replaceAll('{noun}', _getRandomNoun(level))
      .replaceAll('{verb}', _getRandomVerb(level));
  }

  String _getRandomAdjective(String level) {
    final adjectives = _adjectives[level] ?? _adjectives['dad']!;
    return adjectives[_random.nextInt(adjectives.length)];
  }

  String _getRandomNoun(String level) {
    final nouns = _nouns[level] ?? _nouns['dad']!;
    return nouns[_random.nextInt(nouns.length)];
  }

  String _getRandomVerb(String level) {
    final verbs = _verbs[level] ?? _verbs['dad']!;
    return verbs[_random.nextInt(verbs.length)];
  }
}