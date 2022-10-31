import 'package:timeago/timeago.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomMessages {
  const CustomMessages();

  static void initialize() {
    const locales = AppLocalizations.supportedLocales;
    for (final locale in locales) {
      final languageCode = locale.languageCode;
      switch (languageCode) {
        case 'fr':
          setLocaleMessages(
            languageCode,
            _CustomFrMessages(),
          );
          break;
        case 'en':
          setLocaleMessages(
            languageCode,
            EnMessages(),
          );
          break;
        default:
      }
    }
  }

}

class _CustomFrMessages implements LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => "d'ici";
  @override
  String suffixAgo() => '';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => "moins d'une minute";
  @override
  String aboutAMinute(int minutes) => 'environ une minute';
  @override
  String minutes(int minutes) => 'environ $minutes minutes';
  @override
  String aboutAnHour(int minutes) => 'environ une heure';
  @override
  String hours(int hours) => "aujourd'hui";
  @override
  String aDay(int hours) => 'environ un jour';
  @override
  String days(int days) => 'environ $days jours';
  @override
  String aboutAMonth(int days) => 'environ un mois';
  @override
  String months(int months) => 'environ $months mois';
  @override
  String aboutAYear(int year) => 'un an';
  @override
  String years(int years) => '$years ans';
  @override
  String wordSeparator() => ' ';
}

class CustomEnMessages implements LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => '';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'now';
  @override
  String aboutAMinute(int minutes) => '${minutes}m';
  @override
  String minutes(int minutes) => '${minutes}m';
  @override
  String aboutAnHour(int minutes) => '${minutes}m';
  @override
  String hours(int hours) => '${hours}h';
  @override
  String aDay(int hours) => '${hours}h';
  @override
  String days(int days) => '${days}d';
  @override
  String aboutAMonth(int days) => '${days}d';
  @override
  String months(int months) => '${months}mo';
  @override
  String aboutAYear(int year) => '${year}y';
  @override
  String years(int years) => '${years}y';
  @override
  String wordSeparator() => ' ';
}
