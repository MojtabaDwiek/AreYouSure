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
    ],
  };

  final Map<String, List<String>> _adjectives = {
    'dad': ['funny', 'corny', 'cheesy', 'goofy', 'punny', 'silly', 'lame', 'cringy', 'witty', 'cornball'],
    'knock-knock': ['knock-knock', 'funny', 'silly', 'witty', 'corny', 'classic', 'punny', 'cheesy', 'quirky', 'lame'],
    'one-liner': ['quick', 'sharp', 'dry', 'witty', 'sarcastic', 'clever', 'bold', 'snappy', 'punchy', 'snarky'],
    'dark': ['creepy', 'spooky', 'eerie', 'sinister', 'grim', 'morbid', 'twisted', 'ghastly', 'haunting', 'shadowy'],
  };

  final Map<String, List<String>> _nouns = {
    'dad': ['joke', 'pun', 'dad', 'beard', 'grill', 'lawnmower', 'barbecue', 'toolbox', 'sock', 'sandwich'],
    'knock-knock': ['door', 'who', 'joke', 'visitor', 'friend', 'stranger', 'ghost', 'knocker', 'neighbor', 'puppy'],
    'one-liner': ['quip', 'line', 'punchline', 'zinger', 'comedy', 'wit', 'quipster', 'comedian', 'snark', 'remark'],
    'dark': ['shadow', 'ghost', 'night', 'grave', 'skull', 'monster', 'death', 'darkness', 'scream', 'void'],
  };

  final Map<String, List<String>> _verbs = {
    'dad': ['grill', 'mow', 'fix', 'joke', 'laugh', 'pun', 'grumble', 'snore', 'cook', 'nap'],
    'knock-knock': ['knock', 'answer', 'open', 'laugh', 'wait', 'listen', 'shout', 'hide', 'sneak', 'call'],
    'one-liner': ['cut', 'burn', 'drop', 'hit', 'fire', 'snap', 'deliver', 'roast', 'poke', 'strike'],
    'dark': ['creep', 'haunt', 'lurking', 'whisper', 'scream', 'fade', 'bleed', 'stalk', 'shatter', 'wail'],
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
