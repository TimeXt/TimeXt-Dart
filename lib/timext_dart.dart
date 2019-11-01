library timext_dart;

class TimeXt {
  final double _value;
  final TimeXtUnit _unit;

  TimeXt(this._value, this._unit);

  double inCenturies() => this._value * this._unit._value / TimeXtUnit.Century._value;
  double inDecades() => this._value * this._unit._value / TimeXtUnit.Decade._value;
  double inYears() => this._value * this._unit._value / TimeXtUnit.Year._value;
  double inWeeks() => this._value * this._unit._value / TimeXtUnit.Week._value;
  double inDays() => this._value * this._unit._value / TimeXtUnit.Day._value;
  double inHours() => this._value * this._unit._value / TimeXtUnit.Hour._value;
  double inMinutes() => this._value * this._unit._value / TimeXtUnit.Minute._value;
  double inSeconds() => this._value * this._unit._value / TimeXtUnit.Second._value;
  double inMillis() => this._value * this._unit._value / TimeXtUnit.Millis._value;

  TimeXt toCenturies() => TimeXt(this.inCenturies(), TimeXtUnit.Century);
  TimeXt toDecades() => TimeXt(this.inDecades(), TimeXtUnit.Decade);
  TimeXt toYears() => TimeXt(this.inYears(), TimeXtUnit.Year);
  TimeXt toWeeks() => TimeXt(this.inWeeks(), TimeXtUnit.Week);
  TimeXt toDays() => TimeXt(this.inDays(), TimeXtUnit.Day);
  TimeXt toHours() => TimeXt(this.inHours(), TimeXtUnit.Hour);
  TimeXt toMinutes() => TimeXt(this.inMinutes(), TimeXtUnit.Minute);
  TimeXt toSeconds() => TimeXt(this.inSeconds(), TimeXtUnit.Second);
  TimeXt toMillis() => TimeXt(this.inMillis(), TimeXtUnit.Millis);

  static TimeXt fromDuration(Duration duration, {TimeXtUnit unit: TimeXtUnit.Millis}) => TimeXt(duration.inMilliseconds.toDouble() * TimeXtUnit.Millis._value / unit._value, unit);
  Duration toDuration() => Duration(milliseconds: this.inMillis().toInt());

  operator +(TimeXt other) => TimeXt(((this.inMillis() + other.inMillis()) / this._unit._value) * TimeXtUnit.Millis._value, this._unit);
  operator -(TimeXt other) => TimeXt(((this.inMillis() - other.inMillis()) / this._unit._value) * TimeXtUnit.Millis._value, this._unit);
  operator *(double other) => other == 0 ? throw new NullThrownError() : TimeXt(this._value * other, this._unit);
  operator /(double other) => TimeXt(this._value / other, this._unit);
  operator ==(other) => this.inMillis() == other.inMillis();
  operator >(other) => this.inMillis() > other.inMillis();
  operator <(other) => this.inMillis() < other.inMillis();

  @override int get hashCode => this.inMillis().hashCode;
  @override String toString() => "$_value, $_unit";
}

class TimeXtUnit {
  final double _value;

  const TimeXtUnit._internal(this._value);

  @override String toString() => "$_value";

  static const Century = const TimeXtUnit._internal(3155760000 * 1e3);
  static const Decade = const TimeXtUnit._internal(315576000 * 1e3);
  static const Year = const TimeXtUnit._internal(31557600 * 1e3);
  static const Week = const TimeXtUnit._internal(604800 * 1e3);
  static const Day = const TimeXtUnit._internal(86400 * 1e3);
  static const Hour = const TimeXtUnit._internal(3600 * 1e3);
  static const Minute = const TimeXtUnit._internal(60 * 1e3);
  static const Second = const TimeXtUnit._internal(1e3);
  static const Millis = const TimeXtUnit._internal(1e0);
}

class NumberToString {
  static List _dictionaryToStringList(double time, double divider) {
    List stringList = [];
    var dictionary = {
      "week": [604800 * 1e3, 2 ^ 64],
      "day": [86400 * 1e3, 7],
      "hour": [3600 * 1e3, 24],
      "minute": [60 * 1e3, 60],
      "second": [1e3, 60],
      "millisecond": [1, 1e3]
    };
    dictionary.forEach((key, value) {
      var testValue = ((time / (value.elementAt(0) / divider)) % value.elementAt(1)).floor();
      testValue > 1
          ? stringList.add("$testValue ${key}s")
          : testValue > 0
              ? stringList.add("$testValue $key")
              : stringList.add("");
    });
    return stringList.where((value) => value.length > 0).toList();
  }

  static String formatMillis(double millis) {
    List stringList = _dictionaryToStringList(millis, 1);
    return stringList.length > 0 ? stringList.join(", ") : "0 milliseconds";
  }

  static String formatSeconds(double seconds) {
    List stringList = _dictionaryToStringList(seconds, 1e3);
    return stringList.length > 0 ? stringList.join(", ") : formatMillis(seconds * 1e3);
  }

  static String formatMinutes(double minutes) {
    List stringList = _dictionaryToStringList(minutes, 60 * 1e3);
    return stringList.length > 0 ? stringList.join(", ") : formatSeconds(minutes * 60);
  }

  static String formatHours(double hours) {
    List stringList = _dictionaryToStringList(hours, 3600 * 1e3);
    return stringList.length > 0 ? stringList.join(", ") : formatMinutes(hours * 60);
  }

  static String formatDays(double days) {
    List stringList = _dictionaryToStringList(days, 86400 * 1e3);
    return stringList.length > 0 ? stringList.join(", ") : formatMinutes(days * 24);
  }

  static String formatWeeks(double weeks) {
    List stringList = _dictionaryToStringList(weeks, 604800 * 1e3);
    return stringList.length > 0 ? stringList.join(", ") : formatDays(weeks * 24);
  }
}
