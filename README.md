# TimeXt-Dart - develop branch

[![Version](https://img.shields.io/badge/version-v0.1.0+1-blue.svg)](https://github.com/TimeXt/TimeXt-Dart/releases/tag/v0.0.1+1)
[![Build](https://img.shields.io/badge/build-success-green.svg)](timext)
[![CodeCoverage](https://img.shields.io/badge/codeCoverage-50-orange.svg)](timext)

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Paypal](https://img.shields.io/badge/paypal-donate-blue.svg)](https://www.paypal.me/GuepardoApps)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)

First of all many thanks to [Kizitonwose](https://github.com/kizitonwose/Time) for the original idea and already awesome library!

This library shall help to reduce code like...

```dart
int dayInMillis = 24 * 60 * 60 * 1000       // Represent a day in milliSeconds

```

## How to use

### Basics

```dart
// Type is TimeXt
var threeYears = new TimeXt(3, TimeXtUnit.Year)
var oneWeek = new TimeXt(1, TimeXtUnit.Week)
var threeDays = new TimeXt(3, TimeXtUnit.Day)
var elevenHours = new TimeXt(11, TimeXtUnit.Hour)
var sixMinutes = new TimeXt(6, TimeXtUnit.Minute)
var fiftySeconds = new TimeXt(50, TimeXtUnit.Second)
var hundredMilliseconds = new TimeXt(100, TimeXtUnit.Millisecond)

var oneDayInMillis = new TimeXt(1, TimeXtUnit.Day).inMilliseconds()  // Returns one day in milliseconds
var twoWeeksInHours = new TimeXt(2, TimeXtUnit.Week).inHours()       // Returns two weeks in hours

// Converts the existing 3h-Class into a 180min-Class
var threeHoursToMinutes = new TimeXt(3, TimeXtUnit.Hour).toMinutes()

var duration = new TimeXt(3, TimeXtUnit.Year) + new TimeXt(1, TimeXtUnit.Week) + TimeXt(50, TimeXtUnit.Second)
var multipliedDuration = 1.5 * duration
var dividedDuration = duration / 2

var isLessTrue = new TimeXt(30, TimeXtUnit.Second) < new TimeXt(30001, TimeXtUnit.Millisecond)
var isLessFalse = new TimeXt(3, TimeXtUnit.Week) < new TimeXt(20, TimeXtUnit.Day)

var isBiggerTrue = new TimeXt(1, TimeXtUnit.Day) > new TimeXt(23, TimeXtUnit.Hour)
var isBiggerFalse = new TimeXt(5, TimeXtUnit.Hour) > new TimeXt(301, TimeXtUnit.Minute)
```

## License

TimeXt-Dart is distributed under the MIT license. [See LICENSE](LICENSE.md) for details.

## Note

This is just a prove of conecpt. Dart already has a good class with:

```dart
Duration(minutes: 1)

```

I hope Dart will suport extensions like in kotlin or C# to provide the  possibility to write things like:

```dart
var threeYears = 3.Years()

```
