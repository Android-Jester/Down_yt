# Down Yt
# THIS IS AN INCOMPLETE PROJECT, AND IT IS PROBABLY UNUSABLE FOR NOW
![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

Generated by the [Very Good CLI][very_good_cli_link] 🤖

A simple Youtube Player application which allows you to play and download youtube videos

---

## Getting Started 🚀

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

# THIS Project App only works on Android

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

---

## Working with Translations 🌐

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    },
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

3. Use the new string

```dart
import 'package:down_yt/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    ...

    <key>CFBundleLocalizations</key>
	<array>
		<string>en</string>
		<string>es</string>
	</array>

    ...
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_es.arb
```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

`app_es.arb`

```arb
{
    "@@locale": "es",
    "counterAppBarTitle": "Contador",
    "@counterAppBarTitle": {
        "description": "Texto mostrado en la AppBar de la página del contador"
    }
}
```
# Packages Used
| Package Name                | Link                                                 | Purpose                                                                                                                                   |
|-----------------------------|------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| Youtube Explode Dart        | https://pub.dev/packages/youtube_explode_dart        | HTTP Requests                                                                                                                             |  
| Equatable                   | https://pub.dev/packages/equatable                   | Value Equity                                                                                                                              |    
| Flutter                     | https://flutter.dev                                  | Building the App                                                                                                                          |
| Flutter Bloc                | https://pub.dev/packages/flutter_bloc                | State Management                                                                                                                          | 
| Android Path Provider       | https://pub.dev/packages/android_path_provider       | Provides file paths for Android Devices                                                                                                   |
| Get It                      | https://pub.dev/packages/get_it                      | Service Locator and Dependency Injection(Creation of objects that pass data throughout the app without generating to many class instances |
| Awesome Notifications       | https://pub.dev/packages/awesome_notifications       | Local Notifications                                                                                                                       |
| Dartz                       | https://pub.dev/packages/dartz                       | Functional Programming                                                                                                                    |
| Internet Connection Checker | https://pub.dev/packages/internet_connection_checker | Checking Internet Connectivity                                                                                                            |
| Mini Player                 | https://pub.dev/packages/miniplayer                  | Making the Youtube Like Miniplayer                                                                                                        |
| Path Provider               | https://pub.dev/packages/miniplayer                  | Provides file path for all                                                                                                                |
| Permission Handler          | https://pub.dev/packages/miniplayer                  | Handling Android Permissions                                                                                                              |
| PIP View                    | https://pub.dev/packages/miniplayer                  | Enabling PIP View In-App                                                                                                                  |
| Pod Player                  | https://pub.dev/packages/miniplayer                  | Video Player                                                                                                                              |
| WebViewX                    | https://pub.dev/packages/miniplayer                  | Webview                                                                                                                                   |



[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli

# Folder Structure
```
.
├── app
│   ├── core
│   │   ├── Error
│   │   │   ├── Exceptions
│   │   │   └── Failures
│   │   ├── network
│   │   └── use_case
│   ├── dependency
│   └── view
├── features
│   ├── downloader
│   │   ├── data
│   │   │   ├── datasources
│   │   │   ├── models
│   │   │   └── repositories
│   │   ├── domain
│   │   │   ├── entities
│   │   │   ├── repositories
│   │   │   └── usecases
│   │   └── presentation
│   │       ├── bloc
│   │       ├── pages
│   │       └── widgets
│   └── player
│       ├── data
│       │   ├── datasources
│       │   │   └── remote
│       │   ├── models
│       │   └── repositories
│       ├── domain
│       │   ├── entities
│       │   ├── repositories
│       │   └── usecases
│       └── presentation
│           ├── bloc
│           │   ├── player
│           │   └── search
│           ├── pages
│           │   ├── Search
│           │   │   └── Components
│           │   └── VideoPlayer
│           │       └── components
│           └── widgets
│               └── video_info
└── l10n
    └── arb
```
