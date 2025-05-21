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
    "You’ll {verb} forever, haunted by the {adjective} {noun}.",
    "Once you hear the {noun}, your soul will {verb} with {adjective} dread.",
    "Every {adjective} {noun} knows how to {verb} your dreams.",
    "Every {adjective} {noun} knows how to {verb} your dreams.",
    "When the clock strikes midnight, the {noun} begins to {verb} in {adjective} whispers.",
    "The {adjective} {noun} will {verb} you under the {noun}.",
    "You’ll {verb} forever, haunted by the {adjective} {noun}.",
    "Whispers of the {adjective} {noun} will make you {verb} in fear.",
    "When the clock strikes midnight, the {noun} begins to {verb} in {adjective} whispers.",
    "When the clock strikes midnight, the {noun} begins to {verb} in {adjective} whispers.",
    "Beware the {adjective} {noun} that {verb}s at your window.",
    "Once you hear the {noun}, your soul will {verb} with {adjective} dread.",
    "A {adjective} breeze brings the {noun} that loves to {verb}.",
    "Beware the {adjective} {noun} that {verb}s at your window.",
    "The {adjective} {noun} will {verb} you under the {noun}.",
    "Beware the {adjective} {noun} that {verb}s at your window.",
    "You can't escape the {adjective} curse of the {noun} that {verb}s.",
    "The {adjective} {noun} will {verb} you under the {noun}.",
    "Once you hear the {noun}, your soul will {verb} with {adjective} dread.",
    "Every {adjective} {noun} knows how to {verb} your dreams.",
    "The {adjective} {noun} will {verb} you under the {noun}.",
  ],
    'creepy': [
    "The {noun} that {verb}s under your bed is far too {adjective} to ignore.",
    "In the {adjective} silence, a {noun} begins to {verb}.",
    "A {adjective} {noun} followed you home and now it {verb}s.",
    "Your {noun} is not yours anymore—it’s been {verb}ed by something {adjective}.",
    "A {adjective} giggle and a {noun} that {verb}s—it’s already inside.",
    "Don’t {verb} in the dark or the {adjective} {noun} will see you.",
    "Something {adjective} is hiding in your {noun}, waiting to {verb}.",
    "When the lights flicker, the {adjective} {noun} {verb}s again.",
    "You locked the door, but the {noun} that {verb}s is still in.",
    "The {adjective} {noun} whispers your name to make you {verb}.",
    "Your {noun} is not yours anymore—it’s been {verb}ed by something {adjective}.",
    "Something {adjective} is hiding in your {noun}, waiting to {verb}.",
    "Something {adjective} is hiding in your {noun}, waiting to {verb}.",
    "Something {adjective} is hiding in your {noun}, waiting to {verb}.",
    "A {adjective} {noun} followed you home and now it {verb}s.",
    "Don’t {verb} in the dark or the {adjective} {noun} will see you.",
    "A {adjective} giggle and a {noun} that {verb}s—it’s already inside.",
    "A {adjective} giggle and a {noun} that {verb}s—it’s already inside.",
    "Don’t {verb} in the dark or the {adjective} {noun} will see you.",
    "Something {adjective} is hiding in your {noun}, waiting to {verb}.",
    "The {noun} that {verb}s under your bed is far too {adjective} to ignore.",
    "Don’t {verb} in the dark or the {adjective} {noun} will see you.",
    "The {adjective} {noun} whispers your name to make you {verb}.",
    "Your {noun} is not yours anymore—it’s been {verb}ed by something {adjective}.",
    "You locked the door, but the {noun} that {verb}s is still in.",
    "When the lights flicker, the {adjective} {noun} {verb}s again.",
    "In the {adjective} silence, a {noun} begins to {verb}.",
    "The {noun} that {verb}s under your bed is far too {adjective} to ignore.",
    "Don’t {verb} in the dark or the {adjective} {noun} will see you.",
    "In the {adjective} silence, a {noun} begins to {verb}.",
  ],
    'haunting': [
    "The {adjective} {noun} that {verb}ed you will never leave.",
    "You’ll hear the {noun} {verb} every night until you’re {adjective} too.",
    "No matter where you go, the {adjective} {noun} will {verb} beside you.",
    "The mirror holds a {noun} that {verb}s only when you're {adjective}.",
    "The {noun} that {verb}s your name is more {adjective} than death.",
    "It left a mark. The {adjective} {noun} now knows how to {verb}.",
    "The {noun} you forgot now {verb}s in your {adjective} dreams.",
    "Once touched by the {adjective} {noun}, you begin to {verb} too.",
    "You’ll {verb} through eternity, hunted by the {adjective} {noun}.",
    "Even silence {verb}s with the weight of that {adjective} {noun}.",
    "The {noun} that {verb}s your name is more {adjective} than death.",
    "No matter where you go, the {adjective} {noun} will {verb} beside you.",
    "It left a mark. The {adjective} {noun} now knows how to {verb}.",
    "Even silence {verb}s with the weight of that {adjective} {noun}.",
    "The {adjective} {noun} that {verb}ed you will never leave.",
    "The {noun} you forgot now {verb}s in your {adjective} dreams.",
    "You’ll hear the {noun} {verb} every night until you’re {adjective} too.",
    "The {noun} that {verb}s your name is more {adjective} than death.",
    "You’ll {verb} through eternity, hunted by the {adjective} {noun}.",
    "Even silence {verb}s with the weight of that {adjective} {noun}.",
    "Once touched by the {adjective} {noun}, you begin to {verb} too.",
    "The {noun} that {verb}s your name is more {adjective} than death.",
    "The {noun} you forgot now {verb}s in your {adjective} dreams.",
    "No matter where you go, the {adjective} {noun} will {verb} beside you.",
    "The {adjective} {noun} that {verb}ed you will never leave.",
    "You’ll {verb} through eternity, hunted by the {adjective} {noun}.",
    "The mirror holds a {noun} that {verb}s only when you're {adjective}.",
    "Even silence {verb}s with the weight of that {adjective} {noun}.",
    "The {adjective} {noun} that {verb}ed you will never leave.",
    "The {adjective} {noun} that {verb}ed you will never leave.",
  ],
    'eldritch': [
    "The {adjective} {noun} from beyond the veil begins to {verb}.",
    "You can’t {verb} what the {adjective} {noun} has already consumed.",
    "The sky cracked, and a {noun} too {adjective} to name began to {verb}.",
    "Eyes where none should be, the {adjective} {noun} {verb}s.",
    "Your reality {verb}s around the presence of the {adjective} {noun}.",
    "When the stars align, the {noun} shall {verb} in {adjective} madness.",
    "A {adjective} chant beckons the {noun} that {verb}s inside your soul.",
    "The {noun} that {verb}s through time is horribly {adjective}.",
    "Every time you sleep, the {adjective} {noun} begins to {verb} again.",
    "Existence is a lie whispered by the {adjective} {noun} that {verb}s the void.",
    "The {adjective} {noun} from beyond the veil begins to {verb}.",
    "A {adjective} chant beckons the {noun} that {verb}s inside your soul.",
    "When the stars align, the {noun} shall {verb} in {adjective} madness.",
    "The {adjective} {noun} from beyond the veil begins to {verb}.",
    "When the stars align, the {noun} shall {verb} in {adjective} madness.",
    "Eyes where none should be, the {adjective} {noun} {verb}s.",
    "Your reality {verb}s around the presence of the {adjective} {noun}.",
    "The {noun} that {verb}s through time is horribly {adjective}.",
    "When the stars align, the {noun} shall {verb} in {adjective} madness.",
    "Existence is a lie whispered by the {adjective} {noun} that {verb}s the void.",
    "You can’t {verb} what the {adjective} {noun} has already consumed.",
    "The {noun} that {verb}s through time is horribly {adjective}.",
    "The {adjective} {noun} from beyond the veil begins to {verb}.",
    "The {adjective} {noun} from beyond the veil begins to {verb}.",
    "You can’t {verb} what the {adjective} {noun} has already consumed.",
    "Every time you sleep, the {adjective} {noun} begins to {verb} again.",
    "A {adjective} chant beckons the {noun} that {verb}s inside your soul.",
    "The {adjective} {noun} from beyond the veil begins to {verb}.",
    "Your reality {verb}s around the presence of the {adjective} {noun}.",
    "Existence is a lie whispered by the {adjective} {noun} that {verb}s the void.",
  ],
  };

  final Map<String, List<String>> _adjectives = {
    'spooky': ['eerie', 'ghostly', 'bone-chilling', 'unnerving', 'cursed', 'hollow', 'whispering', 'foggy', 'dusky', 'ominous'],
    'creepy': ['disturbing', 'unsettling', 'weird', 'gross', 'sinister', 'glaring', 'silent', 'crawling', 'twisted', 'pale'],
    'haunting': ['eternal', 'sad', 'tormented', 'forsaken', 'wailing', 'mourning', 'broken', 'lonely', 'faded', 'anguished'],
    'eldritch': ['unnameable', 'cosmic', 'mad', 'tentacled', 'insane', 'ancient', 'shapeless', 'alien', 'warped', 'incomprehensible'],
  };

  final Map<String, List<String>> _nouns = {
    'spooky': ['ghost', 'spirit', 'breeze', 'shadow', 'floorboard', 'lantern', 'owl', 'fog', 'whisper', 'figure'],
    'creepy': ['doll', 'clown', 'reflection', 'basement', 'crawlspace', 'tap', 'mirror', 'knock', 'scream', 'closet'],
    'haunting': ['soul', 'cry', 'grave', 'voice', 'dream', 'mourner', 'chain', 'portrait', 'curse', 'echo'],
    'eldritch': ['thing', 'god', 'entity', 'abomination', 'sigil', 'mind', 'void', 'horror', 'cult', 'form'],
  };

  final Map<String, List<String>> _verbs = {
    'spooky': ['whisper', 'float', 'glide', 'rattle', 'shiver', 'hide', 'appear', 'linger', 'fade', 'hover'],
    'creepy': ['crawl', 'blink', 'giggle', 'tap', 'watch', 'breathe', 'stare', 'move', 'wait', 'drag'],
    'haunting': ['weep', 'moan', 'follow', 'linger', 'scream', 'hover', 'curse', 'groan', 'appear', 'sink'],
    'eldritch': ['shift', 'warp', 'consume', 'fracture', 'melt', 'pulse', 'echo', 'distort', 'collapse', 'bleed'],
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
