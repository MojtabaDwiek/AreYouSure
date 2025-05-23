import 'dart:math';

class MotivationGenerator {
  final Map<String, List<String>> _templates = {
    'encouraging': [
      "Every small step counts. Today you're {adjective} than yesterday!",
      "You've got this! Remember: {noun} is just a stepping stone.",
      "Be {adjective} like the {noun}. Steady progress leads to success.",
      "When things get tough, just {verb} and keep going!",
      "You're doing better than you think. That {noun} will pass.",
      "Today's challenge is tomorrow's {noun}. Keep pushing!",
      "You're more {adjective} than you realize. Trust the process.",
      "Even the {noun} had to start somewhere. You're on your way!",
      "Take a deep breath and {verb}. You've overcome harder things.",
      "Progress isn't always {adjective}, but it's always happening.",
      "Your {noun} is growing stronger every day. Keep nurturing it!",
      "When you feel like quitting, just {verb} one more time.",
      "You're becoming more {adjective} with every challenge.",
      "The {noun} you fear is often the {noun} you need.",
      "Small {adjective} actions lead to big results over time.",
      "You're not stuck - you're just {verb} before the breakthrough.",
      "Your current {noun} doesn't define your future {noun}.",
      "Be {adjective} to yourself. Growth takes time.",
      "Every {noun} was once just a {adjective} idea.",
      "You're building {adjective} skills even when it doesn't feel like it.",
      "You've already made it this far—don't forget how {adjective} that is!",
      "Each {noun} you face is shaping a more {adjective} version of you.",
      "Stay focused and {verb} through the doubt. You're making progress.",
      "No one becomes {adjective} overnight. But you're getting closer daily.",
      "You're the kind of {noun} that grows stronger under pressure.",
      "Even a {noun} knows when to pause and {verb}. Rest is part of growth.",
      "What feels hard now will become your most {adjective} story later.",
      "Every setback is a setup for a {adjective} comeback.",
      "You're quietly becoming someone {adjective}—keep going.",
      "The path isn't always clear, but your {noun} is.",
      "Breathe, {verb}, and believe—your journey matters.",
      "Behind every success is a series of {adjective} efforts like yours.",
      "You're planting seeds of {noun} with every step you take.",
      "Let yourself be {adjective}, not perfect.",
      "Today's effort is laying down tomorrow's {noun}.",
      "Sometimes the most {adjective} growth comes from quiet persistence.",
      "Keep going until your {noun} becomes your strength.",
      "There's no shame in slowing down to {verb}—just don't stop.",
      "Being {adjective} is part of becoming strong.",
      "Each day you show up, you're becoming more {adjective}."
    ],
    'uplifting': [
      "Amazing things are coming your way! Stay {adjective}!",
      "Your potential is limitless! Go {verb} those dreams!",
      "Wow! Look how far you've come! That {noun} is no match for you!",
      "You're crushing it! That {adjective} attitude is working!",
      "Boom! Another day to be {adjective}! Make it count!",
      "Nothing can stop you now! That {noun} is history!",
      "Feel that? That's your {adjective} power growing!",
      "You're on fire! Keep {verb} toward your goals!",
      "Incredible! You're turning obstacles into {noun}!",
      "Your {adjective} spirit is unstoppable! Keep shining!",
      "Yes! You're exactly where you need to be! That {noun} is proof!",
      "High five! You're more {adjective} than you know!",
      "Look at you go! Turning {noun} into {noun} like a pro!",
      "Your {adjective} energy is changing everything! Keep it up!",
      "Fantastic! Every {verb} brings you closer to success!",
      "You're a {adjective} superstar! The world needs your light!",
      "Unstoppable! That {noun} doesn't stand a chance!",
      "Phenomenal! Your {adjective} mindset is paying off!",
      "You're not just {verb} - you're thriving! Amazing!",
      "Outstanding! Your {noun} is inspiring others too!",
      "Keep that {adjective} fire burning bright every day!",
      "Nothing beats your {adjective} courage—keep {verb} on!",
      "Your {noun} is a beacon lighting the path ahead!",
      "Every {verb} you take builds an incredible {noun}!",
      "That {adjective} spark inside you ignites greatness!",
      "Celebrate your wins—they show how {adjective} you are!",
      "You're crafting a {noun} story full of {adjective} moments!",
      "Step by step, your {adjective} efforts pay off big time!",
      "Your {noun} is the foundation of your {adjective} journey!",
      "Brilliant! You're mastering the art of {verb} with style!",
      "With your {adjective} heart, nothing is impossible!",
      "Keep dreaming big and {verb} with all your might!",
      "That {noun} in your hands is shaping a brighter future!",
      "You're a {adjective} force turning ideas into reality!",
      "Every {verb} forward is a step toward your {adjective} destiny!",
      "Your {noun} shines brighter than the toughest challenges!",
      "Keep your {adjective} head high and your spirit higher!",
      "You're making the impossible look {adjective} easy!",
      "With every {verb}, you're writing your own {noun} legend!",
      "Your {adjective} soul inspires everyone around you!"
    ],
    'inspiring': [
      "Rise up! Your {adjective} strength is greater than any {noun}!",
      "The world needs your {adjective} spirit now more than ever!",
      "You were born to {verb} what others think is impossible!",
      "No {noun} can withstand your {adjective} determination!",
      "Stand tall! Your journey is creating a {adjective} legacy!",
      "You are the architect of your destiny - {verb} boldly!",
      "Within you lies the power to transform {noun} into {noun}!",
      "Your {adjective} courage is rewriting the rules!",
      "This is your moment! {Verb} with everything you've got!",
      "The fire in your soul can {verb} any obstacle!",
      "You're not just surviving - you're {verb} to thrive!",
      "Your {adjective} vision is changing the game!",
      "Every cell in your body is aligned for {adjective} success!",
      "The universe conspires to help those who {verb} fearlessly!",
      "Your {noun} is merely fuel for your {adjective} comeback!",
      "You contain multitudes - {adjective} power beyond measure!",
      "Today you {verb} what yesterday said was impossible!",
      "Your {adjective} energy creates ripples of change!",
      "No force can stop a soul that's {verb} with purpose!",
      "You're a force of nature - {adjective} and unstoppable!",
      "Let your {adjective} heart guide you through every {noun}!",
      "With every {verb}, you're building a {adjective} future!",
      "Your {noun} speaks volumes about your {adjective} spirit!",
      "Keep {verb} beyond limits — greatness awaits!",
      "Your {adjective} dreams are the seeds of change!",
      "Nothing compares to your {adjective} will to {verb}!",
      "Harness the {adjective} power within and rise!",
      "Your {noun} is the canvas; your life is the {adjective} art!",
      "With {adjective} grace, you conquer every {noun}!",
      "Be bold. Be {adjective}. Keep {verb} forward!",
      "Your {adjective} mind shapes a world full of possibilities!",
      "Every {verb} you take fuels your {adjective} legacy!",
      "Your {noun} reflects the {adjective} fire inside!",
      "Push past the {noun}; your {adjective} spirit will prevail!",
      "The {adjective} strength inside you knows no bounds!",
      "Stay {adjective}, stay fierce, and keep {verb} on!",
      "You're a beacon of {adjective} hope in the {noun} of life!",
      "Let your {adjective} passion be louder than any {noun}!",
      "Your {adjective} soul turns {noun} into miracles!",
      "Today, your {adjective} actions inspire tomorrow's {noun}!"
    ],
    'unstoppable': [
      "You are undergoing a {adjective} metamorphosis - trust the process!",
      "Your current {noun} is just the cocoon for your {adjective} awakening!",
      "Every cell in your body is {verb} to your highest potential!",
      "You're not who you were - a {adjective} being is emerging!",
      "The {noun} you fear is actually your {adjective} teacher!",
      "Your soul is {verb} its most magnificent expression!",
      "What feels like {noun} is actually {adjective} transformation!",
      "You're shedding old layers to reveal your {adjective} essence!",
      "The universe is {verb} through you in {adjective} ways!",
      "Your challenges are sculpting you into a {adjective} masterpiece!",
      "You're not stuck - you're {verb} at the deepest level!",
      "Your {noun} is the raw material for your {adjective} rebirth!",
      "Every moment is {verb} you toward your highest self!",
      "You're a {adjective} phoenix rising from the ashes of {noun}!",
      "Your DNA is {verb} to align with your {adjective} destiny!",
      "The {noun} before you is the doorway to your {adjective} self!",
      "You're not just changing - you're {verb} into your truth!",
      "Your {adjective} potential is unfolding in perfect timing!",
      "What appears as {noun} is actually your {adjective} breakthrough!",
      "You're being rewired for {adjective} success on all levels!",
      "The {adjective} power inside you is unstoppable and fierce!",
      "You're {verb} beyond limits to claim your {adjective} throne!",
      "Every {noun} you face is a stepping stone to your {adjective} rise!",
      "Your spirit is {verb} freely toward {adjective} horizons!",
      "The {adjective} fire in your soul will never be extinguished!",
      "Each {verb} forward reshapes your {adjective} destiny!",
      "Your {noun} fuels the {adjective} force within you!",
      "You are {verb} through barriers with {adjective} grace!",
      "The {adjective} strength you wield is born from {noun} conquered!",
      "Every {noun} behind you is proof of your {adjective} will!",
      "You are {verb} with purpose and a {adjective} heart!",
      "Nothing can dim your {adjective} light or slow your {verb}!",
      "Your {adjective} spirit is a beacon through the darkest {noun}!",
      "The {noun} you leave behind is the soil for your {adjective} growth!",
      "You're {verb} into your highest expression with {adjective} confidence!",
      "Every {noun} transforms into a {adjective} victory under your will!",
      "Your {adjective} courage breaks chains and builds new {noun}!",
      "You are {verb} stronger, wiser, and more {adjective} every day!",
      "The {adjective} energy you embody shapes a limitless {noun}!",
      "Keep {verb} onward—the {adjective} world awaits your arrival!"
    ],
  };

  final Map<String, List<String>> _adjectives = {
    'encouraging': [
      'stronger', 'wiser', 'better', 'brighter', 'lighter',
      'calmer', 'clearer', 'healthier', 'happier', 'smarter',
      'kinder', 'warmer', 'braver', 'truer', 'richer',
      'steadier', 'firmer', 'gentler', 'deeper', 'fuller',
      'sharper', 'keener', 'fresher', 'newer', 'cleaner',
      'purer', 'simpler', 'tougher', 'softer', 'smoother',
      'quicker', 'slower', 'cooler', 'warmer', 'louder',
      'quieter', 'faster', 'slower', 'higher', 'lower'
    ],
    'uplifting': [
      'awesome', 'fantastic', 'amazing', 'incredible', 'unbelievable',
      'phenomenal', 'outstanding', 'extraordinary', 'remarkable',
      'magnificent', 'brilliant', 'exceptional', 'stellar', 'super',
      'mega', 'epic', 'legendary', 'sensational', 'stupendous', 'tremendous',
      'marvelous', 'glorious', 'splendid', 'divine', 'heavenly',
      'miraculous', 'wondrous', 'prodigious', 'monumental', 'colossal',
      'gigantic', 'titanic', 'mammoth', 'vast', 'immense',
      'boundless', 'limitless', 'infinite', 'cosmic', 'universal'
    ],
    'inspiring': [
      'unshakable', 'unstoppable', 'indomitable', 'formidable', 'mighty',
      'titanic', 'colossal', 'profound', 'limitless', 'boundless',
      'infinite', 'supreme', 'exceptional', 'extraordinary', 'legendary',
      'heroic', 'valiant', 'dauntless', 'fearless', 'courageous',
      'gallant', 'intrepid', 'resolute', 'steadfast', 'adamant',
      'unyielding', 'relentless', 'persistent', 'tenacious', 'dogged',
      'determined', 'committed', 'dedicated', 'passionate', 'fervent',
      'ardent', 'zealous', 'vigorous', 'dynamic', 'energetic'
    ],
    'unstoppable': [
      'divine', 'sacred', 'alchemical', 'quantum', 'metamorphic',
      'transcendent', 'evolutionary', 'revolutionary', 'awakened',
      'enlightened', 'expanded', 'liberated', 'unleashed', 'unbound',
      'limitless', 'infinite', 'eternal', 'timeless', 'spaceless', 'formless',
      'omnipotent', 'omniscient', 'omnipresent', 'cosmic', 'universal',
      'celestial', 'astral', 'ethereal', 'mystical', 'magical',
      'alchemical', 'transformative', 'transmutational', 'metamorphic', 'transfigurative',
      'sublime', 'exalted', 'glorified', 'illuminated', 'realized'
    ]
  };

  final Map<String, List<String>> _nouns = {
    'encouraging': [
      'challenge', 'setback', 'obstacle', 'difficulty', 'hurdle',
      'problem', 'issue', 'worry', 'concern', 'doubt',
      'fear', 'mistake', 'failure', 'lesson', 'experience',
      'struggle', 'trial', 'test', 'roadblock', 'barrier',
      'hiccup', 'snag', 'glitch', 'bump', 'complication',
      'delay', 'detour', 'impediment', 'blockage', 'stumbling block',
      'adversity', 'misfortune', 'tribulation', 'ordeal', 'hardship',
      'reverse', 'disappointment', 'frustration', 'setback', 'defeat'
    ],
    'uplifting': [
      'success', 'breakthrough', 'victory', 'achievement', 'milestone',
      'triumph', 'accomplishment', 'win', 'peak', 'summit',
      'highlight', 'best', 'top', 'prime', 'glory',
      'accolade', 'honor', 'distinction', 'feat', 'exploit',
      'coup', 'masterstroke', 'tour de force', 'wonder', 'miracle',
      'marvel', 'phenomenon', 'sensation', 'hit', 'smash',
      'boon', 'blessing', 'godsend', 'windfall', 'bonanza',
      'jackpot', 'prize', 'reward', 'crown', 'laurels'
    ],
    'inspiring': [
      'mountain', 'ocean', 'storm', 'fire', 'thunder',
      'lightning', 'sun', 'star', 'galaxy', 'universe',
      'destiny', 'fate', 'legacy', 'kingdom', 'empire',
      'horizon', 'sky', 'cosmos', 'infinity', 'eternity',
      'dawn', 'dusk', 'twilight', 'zenith', 'nadir',
      'vortex', 'whirlwind', 'tempest', 'typhoon', 'hurricane',
      'volcano', 'earthquake', 'tidal wave', 'avalanche', 'blizzard',
      'wilderness', 'frontier', 'odyssey', 'quest', 'crusade'
    ],
    'unstoppable': [
      'phoenix', 'butterfly', 'lotus', 'diamond', 'gold',
      'light', 'consciousness', 'awareness', 'being', 'soul',
      'essence', 'spirit', 'truth', 'potential', 'destiny',
      'awakening', 'enlightenment', 'liberation', 'freedom', 'nirvana',
      'satori', 'samadhi', 'moksha', 'salvation', 'redemption',
      'transfiguration', 'metamorphosis', 'transmutation', 'alchemy', 'evolution',
      'revolution', 'renaissance', 'rebirth', 'resurrection', 'ascension',
      'illumination', 'realization', 'actualization', 'manifestation', 'revelation'
    ]
  };

  final Map<String, List<String>> _verbs = {
    'encouraging': [
      'breathe', 'pause', 'reflect', 'rest', 'recharge',
      'regroup', 'recenter', 'rebalance', 'renew', 'refresh',
      'rejuvenate', 'replenish', 'nurture', 'heal', 'grow',
      'recover', 'rebuild', 'restore', 'revive', 'reawaken',
      'rekindle', 'reignite', 'rediscover', 'relearn', 'reimagine',
      'redefine', 'reinvent', 'transform', 'evolve', 'progress',
      'advance', 'improve', 'develop', 'mature', 'blossom',
      'flourish', 'thrive', 'prosper', 'succeed', 'prevail'
    ],
    'uplifting': [
      'chase', 'pursue', 'achieve', 'accomplish', 'conquer',
      'dominate', 'crush', 'smash', 'nail', 'rock',
      'own', 'master', 'win', 'succeed', 'excel',
      'shine', 'radiate', 'glow', 'beam', 'sparkle',
      'dazzle', 'blaze', 'flourish', 'thrive', 'prosper',
      'boom', 'explode', 'erupt', 'surge', 'soar',
      'ascend', 'climb', 'rise', 'mount', 'scale',
      'transcend', 'surpass', 'outdo', 'outshine', 'outperform'
    ],
    'inspiring': [
      'conquer', 'overcome', 'transcend', 'surpass', 'outshine',
      'outperform', 'outdo', 'exceed', 'eclipse', 'dwarf',
      'tower', 'rise', 'soar', 'ascend', 'dominate',
      'command', 'lead', 'guide', 'direct', 'steer',
      'navigate', 'pilot', 'engineer', 'forge', 'sculpt',
      'mold', 'shape', 'create', 'build', 'construct',
      'establish', 'found', 'institute', 'launch', 'initiate',
      'pioneer', 'innovate', 'invent', 'discover', 'explore'
    ],
    'unstoppable': [
      'awaken', 'transcend', 'evolve', 'transform', 'ascend',
      'expand', 'liberate', 'unfold', 'blossom', 'flower',
      'emerge', 'arise', 'shine', 'radiate', 'illuminate',
      'manifest', 'realize', 'actualize', 'materialize', 'crystallize',
      'embody', 'personify', 'exemplify', 'typify', 'symbolize',
      'represent', 'signify', 'denote', 'express', 'demonstrate',
      'reveal', 'unveil', 'disclose', 'declare', 'proclaim',
      'announce', 'pronounce', 'decree', 'ordain', 'destine'
    ]
  };

  final Random _random = Random();

  String generateMotivation({String level = 'encouraging'}) {
    final templates = _templates[level] ?? _templates['encouraging']!;
    final template = templates[_random.nextInt(templates.length)];

    return template
      .replaceAll('{adjective}', _getRandomAdjective(level))
      .replaceAll('{noun}', _getRandomNoun(level))
      .replaceAll('{verb}', _getRandomVerb(level));
  }

  String _getRandomAdjective(String level) {
    final adjectives = _adjectives[level] ?? _adjectives['encouraging']!;
    return adjectives[_random.nextInt(adjectives.length)];
  }

  String _getRandomNoun(String level) {
    final nouns = _nouns[level] ?? _nouns['encouraging']!;
    return nouns[_random.nextInt(nouns.length)];
  }

  String _getRandomVerb(String level) {
    final verbs = _verbs[level] ?? _verbs['encouraging']!;
    return verbs[_random.nextInt(verbs.length)];
  }
}