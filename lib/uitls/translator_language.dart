class Translations {
  static final languages = <String>[
    'English',
    'Spanish',
    'French',
    'German',
    // 'Italian',
    // 'Russian',
    // 'Arabic',
    'Gujarati',
    'Hindi',
    // 'Japanese',
    'Marathi',
    // 'Mongolian',
    // 'Myanmar',
    // 'Nepali',
    // 'Nyanja',
    // 'Odia',
    // 'Punjabi',
    // 'Sindhi',
    // 'Tajik',
    // 'Tamil',
    // 'Telugu',
    // 'Thai',
    // 'Urdu',
    'Vietnamese',
  ];

  static String getLanguageCode(String language) {
    switch (language) {
      case 'English':
        return 'en';
      case 'Vietnamese':
        return 'vi';
      case 'French':
        return 'fr';
      // case 'Italian':
      //   return 'it';
      // case 'Russian':
      //   return 'ru';
      case 'Spanish':
        return 'es';
      case 'German':
        return 'de';
      // case 'Arabic':
      //   return 'ar';
      case 'Gujarati':
        return 'gu';
      case 'Hindi':
        return 'hi';
      // case 'Japanese':
      //   return 'ja';
      case 'Marathi':
        return 'mr';
      // case 'Mongolian':
      //   return 'mn';
      // case 'Myanmar':
      //   return 'my';
      // case 'Nepali':
      //   return 'ne';
      // case 'Nyanja':
      //   return 'ny';
      // case 'Odia':
      //   return 'or';
      // case 'Punjabi':
      //   return 'pa';
      // case 'Sindhi':
      //   return 'sd';
      // case 'Tajik':
      //   return 'tg';
      // case 'Tamil':
      //   return 'ta';
      // case 'Telugu':
      //   return 'th';
      // case 'Thai':
      //   return 'ur';
      default:
        return 'en';
    }
  }
}
