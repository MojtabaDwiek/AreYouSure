import 'dart:math';

class CurseGenerator {
  final Map<String, List<String>> _templates = {
    'spooky': [
      "The {adjective} {noun} will {verb} you under the {noun}.",
      "You can't escape the {adjective} curse of the {noun} that {verb}s.",
      "When the clock strikes midnight, the {noun} begins to {verb} in {adjective} whispers.",
      "Beware the {adjective} {noun} that {verb}s at your window.",
      "Once you hear the {noun}, your soul will {verb} with {adjective} dread.",
      "A {adjective} breeze brings the {noun} that loves to {verb}.",
      "The {noun} that {verb}s thrice summons a {adjective} fate.",
      "Whispers of the {adjective} {noun} will make you {verb} in fear.",
      "Every {adjective} {noun} knows how to {verb} your dreams.",
      "You'll {verb} forever, haunted by the {adjective} {noun}.",
      "The {adjective} {noun} lurks in corners, waiting to {verb}.",
      "Your shadow isn't yours—it's the {adjective} {noun} that {verb}s.",
      "No light can save you from the {adjective} {noun} that {verb}s.",
      "The {noun} under your bed hungers for {adjective} {verb}ing.",
      "A {adjective} presence makes the {noun} {verb} uncontrollably.",
      "The {adjective} {noun} writes your name before you {verb}.",
      "When you {verb}, the {adjective} {noun} comes closer.",
      "Your breath turns to mist as the {adjective} {noun} {verb}s.",
      "The {adjective} {noun} only {verb}s when you're not looking.",
      "Your reflection {verb}s differently in the {adjective} {noun}'s gaze.",
      "The {adjective} {noun} marks its prey before they {verb}.",
      "Your heartbeat syncs with the {adjective} {noun}'s {verb}ing.",
      "The {adjective} {noun} {verb}s your name in empty rooms.",
      "Every step you take makes the {adjective} {noun} {verb} louder.",
      "The {adjective} {noun} {verb}s where children once played.",
      "Your sanity unravels as the {adjective} {noun} {verb}s.",
      "The {adjective} {noun} {verb}s in patterns only the dead understand.",
      "Your last thought will be of the {adjective} {noun} {verb}ing.",
      "The {adjective} {noun} {verb}s in time with your nightmares.",
      "No prayer stops the {adjective} {noun} from {verb}ing.",
      "The {adjective} {noun} remembers how you {verb}ed.",
      "Your fear feeds the {adjective} {noun}'s {verb}ing.",
      "The {adjective} {noun} {verb}s where shadows are deepest.",
      "Your voice becomes the {adjective} {noun}'s {verb}.",
      "The {adjective} {noun} {verb}s beneath the floorboards.",
      "Your name fades as the {adjective} {noun} {verb}s it away.",
      "The {adjective} {noun} {verb}s where no light remains.",
      "Your memories twist into the {adjective} {noun}'s {verb}ing.",
      "The {adjective} {noun} {verb}s in languages never spoken.",
      "Your fate is sealed when the {adjective} {noun} {verb}s.",
    ],
    'creepy': [
      "The {noun} that {verb}s under your bed is far too {adjective} to ignore.",
      "In the {adjective} silence, a {noun} begins to {verb}.",
      "A {adjective} {noun} followed you home and now it {verb}s.",
      "Your {noun} is not yours anymore—it's been {verb}ed by something {adjective}.",
      "A {adjective} giggle and a {noun} that {verb}s—it's already inside.",
      "Don't {verb} in the dark or the {adjective} {noun} will see you.",
      "Something {adjective} is hiding in your {noun}, waiting to {verb}.",
      "When the lights flicker, the {adjective} {noun} {verb}s again.",
      "You locked the door, but the {noun} that {verb}s is still in.",
      "The {adjective} {noun} whispers your name to make you {verb}.",
      "Your {noun} isn't where you left it—the {adjective} thing {verb}ed it.",
      "The {adjective} {noun} only {verb}s when you're alone.",
      "Your skin crawls where the {adjective} {noun} {verb}ed.",
      "The {adjective} {noun} learns how to {verb} by watching you.",
      "Your {noun} moves on its own when the {adjective} presence {verb}s.",
      "The {adjective} {noun} {verb}s in patterns that shouldn't exist.",
      "You wake to find the {adjective} {noun} has been {verb}ing.",
      "Your reflection {verb}s differently in the {adjective} {noun}'s eyes.",
      "The {adjective} {noun} leaves marks where it {verb}s.",
      "Your breath fogs the glass as the {adjective} {noun} {verb}s behind you.",
      "The {adjective} {noun} mimics voices to make you {verb}.",
      "Your shadow {verb}s independently of the {adjective} {noun}.",
      "The {adjective} {noun} {verb}s in your peripheral vision.",
      "Your name sounds wrong when the {adjective} {noun} {verb}s it.",
      "The {adjective} {noun} {verb}s where you just were.",
      "Your footsteps echo after the {adjective} {noun} {verb}s.",
      "The {adjective} {noun} {verb}s in time with your pulse.",
      "Your hands shake as the {adjective} {noun} {verb}s nearer.",
      "The {adjective} {noun} {verb}s where the walls are thin.",
      "Your voice cracks calling out to the {adjective} {noun} {verb}ing.",
      "The {adjective} {noun} {verb}s beneath your skin.",
      "Your bones ache when the {adjective} {noun} {verb}s.",
      "The {adjective} {noun} {verb}s in abandoned places.",
      "Your teeth chatter as the {adjective} {noun} {verb}s closer.",
      "The {adjective} {noun} {verb}s where children disappear.",
      "Your hair stands up when the {adjective} {noun} {verb}s.",
      "The {adjective} {noun} {verb}s in photographs.",
      "Your pulse races as the {adjective} {noun} {verb}s your name.",
      "The {adjective} {noun} {verb}s where animals won't go.",
      "Your blood runs cold at the {adjective} {noun}'s {verb}ing.",
    ],
    'haunting': [
      "The {adjective} {noun} that {verb}ed you will never leave.",
      "You'll hear the {noun} {verb} every night until you're {adjective} too.",
      "No matter where you go, the {adjective} {noun} will {verb} beside you.",
      "The mirror holds a {noun} that {verb}s only when you're {adjective}.",
      "The {noun} that {verb}s your name is more {adjective} than death.",
      "It left a mark. The {adjective} {noun} now knows how to {verb}.",
      "The {noun} you forgot now {verb}s in your {adjective} dreams.",
      "Once touched by the {adjective} {noun}, you begin to {verb} too.",
      "You'll {verb} through eternity, hunted by the {adjective} {noun}.",
      "Even silence {verb}s with the weight of that {adjective} {noun}.",
      "The {adjective} {noun} {verb}s the names of those who'll join it.",
      "Your {noun} becomes {adjective} after the {verb}ing starts.",
      "The {adjective} {noun} {verb}s where lovers once whispered.",
      "You can't {verb} without the {adjective} {noun} knowing.",
      "The {adjective} {noun} {verb}s in empty houses at dawn.",
      "Your tears feed the {adjective} {noun}'s {verb}ing.",
      "The {adjective} {noun} {verb}s where the dead walked.",
      "You inherit the {adjective} {noun} when you {verb} too much.",
      "The {adjective} {noun} {verb}s in family portraits.",
      "Your childhood home remembers the {adjective} {noun} {verb}ing.",
      "The {adjective} {noun} {verb}s where promises were broken.",
      "Your voice joins the {adjective} {noun}'s {verb}ing chorus.",
      "The {adjective} {noun} {verb}s beneath wedding rings.",
      "Your hands remember how the {adjective} {noun} {verb}ed.",
      "The {adjective} {noun} {verb}s in attics and crawlspaces.",
      "Your name appears where the {adjective} {noun} {verb}ed.",
      "The {adjective} {noun} {verb}s in hospital corridors.",
      "Your breath fades as the {adjective} {noun} {verb}s it away.",
      "The {adjective} {noun} {verb}s beneath church pews.",
      "Your reflection ages with the {adjective} {noun}'s {verb}ing.",
      "The {adjective} {noun} {verb}s where soldiers fell.",
      "Your heartbeat syncs with the {adjective} {noun}'s {verb}ing.",
      "The {adjective} {noun} {verb}s in abandoned nurseries.",
      "Your skin remembers the {adjective} {noun}'s {verb}ing touch.",
      "The {adjective} {noun} {verb}s where no flowers grow.",
      "Your voice cracks calling the {adjective} {noun}'s name.",
      "The {adjective} {noun} {verb}s where the earth is disturbed.",
      "Your shadow belongs to the {adjective} {noun} now.",
      "The {adjective} {noun} {verb}s where the river runs deep.",
      "Your bones remember the {adjective} {noun}'s {verb}ing.",
    ],
    'eldritch': [
      "The {adjective} {noun} from beyond the veil begins to {verb}.",
      "You can't {verb} what the {adjective} {noun} has already consumed.",
      "The sky cracked, and a {noun} too {adjective} to name began to {verb}.",
      "Eyes where none should be, the {adjective} {noun} {verb}s.",
      "Your reality {verb}s around the presence of the {adjective} {noun}.",
      "When the stars align, the {noun} shall {verb} in {adjective} madness.",
      "A {adjective} chant beckons the {noun} that {verb}s inside your soul.",
      "The {noun} that {verb}s through time is horribly {adjective}.",
      "Every time you sleep, the {adjective} {noun} begins to {verb} again.",
      "Existence is a lie whispered by the {adjective} {noun} that {verb}s the void.",
      "The {adjective} {noun} {verb}s in angles that shouldn't exist.",
      "Your mind fractures as the {adjective} {noun} {verb}s its truth.",
      "The {adjective} {noun} {verb}s where geometry breaks down.",
      "You glimpse the {adjective} {noun} when you {verb} too deeply.",
      "The {adjective} {noun} {verb}s in the spaces between atoms.",
      "Your sanity unravels as the {adjective} {noun} {verb}s its name.",
      "The {adjective} {noun} {verb}s where time has no meaning.",
      "You become the {adjective} {noun} when you {verb} the ritual.",
      "The {adjective} {noun} {verb}s in colors not meant for eyes.",
      "Your flesh remembers the {adjective} {noun}'s {verb}ing touch.",
      "The {adjective} {noun} {verb}s where dimensions thin.",
      "You hear the {adjective} {noun} {verb} in your bones.",
      "The {adjective} {noun} {verb}s in the static between stations.",
      "Your dreams become the {adjective} {noun}'s {verb}ing ground.",
      "The {adjective} {noun} {verb}s where mathematics fails.",
      "You taste the {adjective} {noun} when you {verb} in fear.",
      "The {adjective} {noun} {verb}s in the back of every mind.",
      "Your reflection shows the {adjective} {noun} {verb}ing behind you.",
      "The {adjective} {noun} {verb}s where light cannot escape.",
      "You smell the {adjective} {noun} before it {verb}s into being.",
      "The {adjective} {noun} {verb}s in the cracks of the world.",
      "Your voice becomes the {adjective} {noun}'s {verb}ing instrument.",
      "The {adjective} {noun} {verb}s where gods fear to look.",
      "You feel the {adjective} {noun} {verb} in your DNA.",
      "The {adjective} {noun} {verb}s where parallel worlds intersect.",
      "Your shadow belongs to the {adjective} {noun} now.",
      "The {adjective} {noun} {verb}s in the static of dead channels.",
      "You hear the {adjective} {noun} {verb} in your childhood memories.",
      "The {adjective} {noun} {verb}s where all possibilities end.",
      "Your last thought is the {adjective} {noun}'s {verb}ing laughter.",
    ],
  };

  final Map<String, List<String>> _adjectives = {
    'spooky': [
      'eerie', 'ghostly', 'bone-chilling', 'unnerving', 'cursed', 
      'hollow', 'whispering', 'foggy', 'dusky', 'ominous',
      'shivering', 'spectral', 'waning', 'moonlit', 'chilling',
      'dreadful', 'haunted', 'sepulchral', 'nocturnal', 'eldritch',
      'gloomy', 'shadowed', 'creeping', 'waning', 'phantom',
      'deathly', 'ghastly', 'macabre', 'funereal', 'twilight',
      'shuddering', 'grisly', 'pale', 'wan', 'ashen',
      'specter-filled', 'dank', 'miasmic', 'sepulchral', 'grave-cold'
    ],
    'creepy': [
      'disturbing', 'unsettling', 'weird', 'gross', 'sinister', 
      'glaring', 'silent', 'crawling', 'twisted', 'pale',
      'leering', 'sickly', 'off-putting', 'wrong', 'malformed',
      'unnatural', 'slick', 'glistening', 'too-many', 'not-right',
      'skittering', 'twitching', 'jerky', 'wrong-angle', 'off-kilter',
      'breathless', 'hungry-eyed', 'too-close', 'sticky', 'clammy',
      'unblinking', 'too-smooth', 'wrong-teethed', 'pulsing', 'veiny',
      'bulbous', 'too-warm', 'too-cold', 'wrong-jointed', 'not-human'
    ],
    'haunting': [
      'eternal', 'sad', 'tormented', 'forsaken', 'wailing', 
      'mourning', 'broken', 'lonely', 'faded', 'anguished',
      'weeping', 'lost', 'regretful', 'aching', 'hollow-eyed',
      'sorrowful', 'grief-stricken', 'waning', 'pining', 'heartbroken',
      'ghostly', 'lingering', 'unfinished', 'unavenged', 'restless',
      'tear-stained', 'memory-haunted', 'love-lost', 'betrayed', 'forgotten',
      'aching', 'empty', 'echoing', 'faint', 'whispered',
      'time-worn', 'weather-beaten', 'crumbling', 'dust-covered', 'name-scratched'
    ],
    'eldritch': [
      'unnameable', 'cosmic', 'mad', 'tentacled', 'insane', 
      'ancient', 'shapeless', 'alien', 'warped', 'incomprehensible',
      'multi-eyed', 'non-euclidean', 'geometry-breaking', 'time-warping', 'space-folding',
      'dimension-bleeding', 'reality-tearing', 'mind-shattering', 'sanity-rending', 'void-born',
      'star-spawned', 'abyssal', 'primordial', 'cyclopean', 'ichor-dripping',
      'sigil-carved', 'rune-etched', 'forbidden', 'blasphemous', 'apocryphal',
      'time-lost', 'space-twisting', 'angle-wrong', 'fractal-born', 'infinity-eyed',
      'void-whispering', 'dimension-hopping', 'reality-shifting', 'unfathomable', 'outer'
    ],
  };

  final Map<String, List<String>> _nouns = {
    'spooky': [
      'ghost', 'spirit', 'breeze', 'shadow', 'floorboard', 
      'lantern', 'owl', 'fog', 'whisper', 'figure',
      'apparition', 'wraith', 'specter', 'phantom', 'shade',
      'gravestone', 'tombstone', 'mausoleum', 'crypt', 'coffin',
      'raven', 'bat', 'wolf', 'howl', 'moan',
      'sigh', 'footstep', 'knock', 'scratch', 'breath',
      'veil', 'curtain', 'mirror', 'portrait', 'doll',
      'candle', 'flame', 'ember', 'ash', 'dust'
    ],
    'creepy': [
      'doll', 'clown', 'reflection', 'basement', 'crawlspace', 
      'tap', 'mirror', 'knock', 'scream', 'closet',
      'mannequin', 'puppet', 'mask', 'statue', 'painting',
      'attic', 'tunnel', 'well', 'cellar', 'furnace',
      'breathing', 'laughter', 'whimper', 'giggle', 'shushing',
      'hand', 'face', 'smile', 'teeth', 'eyes',
      'skin', 'hair', 'fingers', 'tongue', 'voice'
    ],
    'haunting': [
      'soul', 'cry', 'grave', 'voice', 'dream', 
      'mourner', 'chain', 'portrait', 'curse', 'echo',
      'memory', 'regret', 'tear', 'sigh', 'lament',
      'wail', 'keening', 'funeral', 'wreath', 'epitaph',
      'ring', 'locket', 'letter', 'diary', 'photograph',
      'candle', 'flower', 'rosary', 'hymn', 'prayer',
      'child', 'bride', 'soldier', 'mother', 'lover'
    ],
    'eldritch': [
      'thing', 'god', 'entity', 'abomination', 'sigil', 
      'mind', 'void', 'horror', 'cult', 'form',
      'tendril', 'eye', 'mouth', 'appendage', 'pseudopod',
      'geometry', 'angle', 'fractal', 'non-space', 'between-place',
      'chant', 'ritual', 'sacrifice', 'offering', 'altar',
      'tome', 'glyph', 'rune', 'symbol', 'incantation',
      'star', 'gate', 'portal', 'shard', 'fragment'
    ],
  };

  final Map<String, List<String>> _verbs = {
    'spooky': [
      'whisper', 'float', 'glide', 'rattle', 'shiver', 
      'hide', 'appear', 'linger', 'fade', 'hover',
      'moan', 'sigh', 'creak', 'groan', 'scuttle',
      'tap', 'scratch', 'knock', 'breath', 'murmur',
      'materialize', 'dissolve', 'wail', 'howl', 'screech',
      'beckon', 'point', 'watch', 'follow', 'grasp',
      'dim', 'flicker', 'extinguish', 'reappear', 'vanish'
    ],
    'creepy': [
      'crawl', 'blink', 'giggle', 'tap', 'watch', 
      'breathe', 'stare', 'move', 'wait', 'drag',
      'twitch', 'jerk', 'spasm', 'contort', 'distort',
      'melt', 'reform', 'split', 'multiply', 'ooze',
      'unfold', 'unhinge', 'elongate', 'stretch', 'snap',
      'lick', 'chew', 'gnaw', 'suck', 'pulse'
    ],
    'haunting': [
      'weep', 'moan', 'follow', 'linger', 'scream', 
      'hover', 'curse', 'groan', 'appear', 'sink',
      'replay', 'relive', 'remember', 'regret', 'mourn',
      'wander', 'search', 'call', 'wait', 'return',
      'haunt', 'possess', 'inhabit', 'attach', 'cling',
      'fade', 'diminish', 'wither', 'decay', 'crumble'
    ],
    'eldritch': [
      'shift', 'warp', 'consume', 'fracture', 'melt', 
      'pulse', 'echo', 'distort', 'collapse', 'bleed',
      'unmake', 'rewrite', 'transmute', 'transfigure', 'mutate',
      'unfold', 'invade', 'infest', 'corrupt', 'taint',
      'screech', 'chitter', 'vocalize', 'resonate', 'vibrate',
      'exist', 'not-exist', 'become', 'unbecome', 'cycle'
    ],
  };

  final Random _random = Random();

  String generateCurse({String level = 'spooky'}) {
    final templates = _templates[level] ?? _templates['spooky']!;
    final template = templates[_random.nextInt(templates.length)];

    return template
        .replaceAll('{adjective}', _getRandomAdjective(level))
        .replaceAll('{noun}', _getRandomNoun(level))
        .replaceAll('{verb}', _getRandomVerb(level));
  }

  String _getRandomAdjective(String level) {
    final adjectives = _adjectives[level] ?? _adjectives['spooky']!;
    return adjectives[_random.nextInt(adjectives.length)];
  }

  String _getRandomNoun(String level) {
    final nouns = _nouns[level] ?? _nouns['spooky']!;
    return nouns[_random.nextInt(nouns.length)];
  }

  String _getRandomVerb(String level) {
    final verbs = _verbs[level] ?? _verbs['spooky']!;
    return verbs[_random.nextInt(verbs.length)];
  }
}