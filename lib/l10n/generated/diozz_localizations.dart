import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'diozz_localizations_ar.dart';
import 'diozz_localizations_en.dart';

/// Callers can lookup localized strings with an instance of DizzAppLocalizations returned
/// by `DizzAppLocalizations.of(context)`.
///
/// Applications need to include `DizzAppLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'gen_l10n/diozz_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: DizzAppLocalizations.localizationsDelegates,
///   supportedLocales: DizzAppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the DizzAppLocalizations.supportedLocales
/// property.
abstract class DizzAppLocalizations {
  DizzAppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static DizzAppLocalizations? of(BuildContext context) {
    return Localizations.of<DizzAppLocalizations>(
        context, DizzAppLocalizations);
  }

  static const LocalizationsDelegate<DizzAppLocalizations> delegate =
      _DizzAppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @global_error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred, please check the internet first or review the application administration !'**
  String get global_error;

  /// No description provided for @no_internet_error.
  ///
  /// In en, this message translates to:
  /// **'Please Connect to Internet !'**
  String get no_internet_error;

  /// No description provided for @weak_internet_error.
  ///
  /// In en, this message translates to:
  /// **'Internet signal weak !'**
  String get weak_internet_error;

  /// No description provided for @server_error.
  ///
  /// In en, this message translates to:
  /// **'There is a problem with the server, please check the application management'**
  String get server_error;

  /// No description provided for @lost_page.
  ///
  /// In en, this message translates to:
  /// **'Error : you left the page'**
  String get lost_page;
}

class _DizzAppLocalizationsDelegate
    extends LocalizationsDelegate<DizzAppLocalizations> {
  const _DizzAppLocalizationsDelegate();

  @override
  Future<DizzAppLocalizations> load(Locale locale) {
    return SynchronousFuture<DizzAppLocalizations>(
        lookupPhoneFieldLocalization(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_DizzAppLocalizationsDelegate old) => false;
}

DizzAppLocalizations lookupPhoneFieldLocalization(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return DizzAppLocalizationsAr();
    case 'en':
      return DizzAppLocalizationsEn();
  }

  throw FlutterError(
      'DizzAppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
