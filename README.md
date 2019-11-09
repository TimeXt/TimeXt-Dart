# TimeXt-Dart

[![Version](https://img.shields.io/badge/version-v0.4.1-blue.svg)](https://github.com/TimeXt/TimeXt-Dart/releases/tag/0.2.0)
[![Build](https://img.shields.io/badge/build-success-green.svg)](timext)
[![CodeCoverage](https://img.shields.io/badge/codeCoverage-95-green.svg)](timext)

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
var fiveCenturies = new TimeXt(5, TimeXtUnit.Century)
var tenDecades = new TimeXt(10, TimeXtUnit.Decade)
var threeYears = new TimeXt(3, TimeXtUnit.Year)
var oneWeek = new TimeXt(1, TimeXtUnit.Week)
var threeDays = new TimeXt(3, TimeXtUnit.Day)
var elevenHours = new TimeXt(11, TimeXtUnit.Hour)
var sixMinutes = new TimeXt(6, TimeXtUnit.Minute)
var fiftySeconds = new TimeXt(50, TimeXtUnit.Second)
var hundredMillis = new TimeXt(100, TimeXtUnit.Millis)

var oneDayInMillis = new TimeXt(1, TimeXtUnit.Day).inMillis()  // Returns one day in milliseconds
var twoWeeksInHours = new TimeXt(2, TimeXtUnit.Week).inHours()       // Returns two weeks in hours

// Converts the existing 3h-Class into a 180min-Class
var threeHoursToMinutes = new TimeXt(3, TimeXtUnit.Hour).toMinutes()

var duration = new TimeXt(3, TimeXtUnit.Year) + new TimeXt(1, TimeXtUnit.Week) + TimeXt(50, TimeXtUnit.Second)
var multipliedDuration = 1.5 * duration
var dividedDuration = duration / 2

var isLessTrue = new TimeXt(30, TimeXtUnit.Second) < new TimeXt(30001, TimeXtUnit.Millis)
var isLessFalse = new TimeXt(3, TimeXtUnit.Week) < new TimeXt(20, TimeXtUnit.Day)

var isBiggerTrue = new TimeXt(1, TimeXtUnit.Day) > new TimeXt(23, TimeXtUnit.Hour)
var isBiggerFalse = new TimeXt(5, TimeXtUnit.Hour) > new TimeXt(301, TimeXtUnit.Minute)
```

Since version 0.2.0 TimeXt has new extensions for the long type to display this number value in a human readable string format.
Since version 0.3.0 TimeXt supports double numbers.

```dart
var readableStringFromMillis = NumberToString.formatMillis(34325055574) // 56 weeks, 5 days, 6 hours, 44 minutes, 15 seconds, 574 milliseconds
var readableStringFromSeconds = NumberToString.formatSeconds(4350554) // 7 weeks, 1 day, 8 hours, 29 minutes, 14 seconds
var readableStringFromMinutes = NumberToString.formatMinutes(432555) // 42 weeks, 6 days, 9 hours, 15 minutes
var readableStringFromHours = NumberToString.formatHours(4574) // 27 weeks, 1 day, 14 hours
var readableStringFromDays = NumberToString.formatDays(15.5) // 2 weeks, 1 day, 12 hours
var readableStringFromWeeks = NumberToString.formatWeeks(24.5) // 24 weeks, 3 days, 12 hours
```

## Contributors

| [<img alt="JonasSchubert" src="https://avatars0.githubusercontent.com/u/21952813?v=4&s=117" width="117"/>](https://github.com/JonasSchubert) |
| :---------------------------------------------------------------------------------------------------------------------------------------: |
| [Jonas Schubert](https://github.com/JonasSchubert) |

## License

TimeXt-Dart is distributed under the MIT license. [See LICENSE](LICENSE.md) for details.

```
MIT License

Copyright (c) 2019 Jonas Schubert

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## Note

This is just a prove of conecpt. Dart already has a good class with:

```dart
Duration(minutes: 1)

```

I hope Dart will suport extensions like in kotlin or C# to provide the  possibility to write things like:

```dart
var threeYears = 3.Years()

```
