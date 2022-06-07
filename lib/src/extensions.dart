part of katana_flutter;

/// Provides localize extensions to [String].
extension LocalizeStringExtensions on String {
  /// Get translated text.
  ///
  /// By specifying [language], you can translate in a specific language.
  ///
  /// If [language] is specified and the specified language is not available,
  /// the translation will be performed in English.
  String localize({String? language}) => Localize.get(
        this,
        defaultValue: this,
        language: language,
      );
}

/// Provides general extensions to [String?].
extension NullableLocalizeStringExtensions on String? {
  /// Get translated text.
  String localize(String defaultValue) {
    if (this == null) {
      return defaultValue;
    }
    return Localize.get(this!, defaultValue: this!);
  }
}

/// Provides flutter extensions to [DateTime].
extension FlutterDateTimeExtensions on DateTime {
  /// Gets the localized week.
  String get localizedWeekDay => "WeekDay${weekday.toString()}".localize();

  /// Gets the localized week.
  String get shortLocalizedWeekDay => "Week${weekday.toString()}".localize();

  /// Only time is extracted.
  TimeOfDay toTime() {
    return TimeOfDay.fromDateTime(this);
  }

  /// Sets the hour and minute of a [DateTime] from a [TimeOfDay].
  DateTime combine(TimeOfDay time) {
    return DateTime(year, month, day, time.hour, time.minute);
  }
}

/// Provides general extensions to [Color].
extension ColorExtensions on Color {
  /// Makes the color darker.
  ///
  /// The higher the value(0.0 - 1.0), the darker the image becomes.
  Color darken([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }

  /// Makes the color lighter.
  ///
  /// The higher the value(0.0 - 1.0), the lighter the image becomes.
  Color lighten([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }
}
