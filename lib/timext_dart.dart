library timext_dart;

class TimeXt {
  final double _value;
  final TimeXtUnit _unit;

  TimeXt(this._value, this._unit);

  double inYears() => this._value * this._unit._value / TimeXtUnit.Year._value;
  double inWeeks() => this._value * this._unit._value / TimeXtUnit.Week._value;
  double inDays() => this._value * this._unit._value / TimeXtUnit.Day._value;
  double inHours() => this._value * this._unit._value / TimeXtUnit.Hour._value;
  double inMinutes() => this._value * this._unit._value / TimeXtUnit.Minute._value;
  double inSeconds() => this._value * this._unit._value / TimeXtUnit.Second._value;
  double inMilliseconds() => this._value * this._unit._value / TimeXtUnit.Millisecond._value;

  TimeXt toYears() => TimeXt(this.inYears(), TimeXtUnit.Year);
  TimeXt toWeeks() => TimeXt(this.inWeeks(), TimeXtUnit.Week);
  TimeXt toDays() => TimeXt(this.inDays(), TimeXtUnit.Day);
  TimeXt toHours() => TimeXt(this.inHours(), TimeXtUnit.Hour);
  TimeXt toMinutes() => TimeXt(this.inMinutes(), TimeXtUnit.Minute);
  TimeXt toSeconds() => TimeXt(this.inSeconds(), TimeXtUnit.Second);
  TimeXt toMilliseconds() => TimeXt(this.inMilliseconds(), TimeXtUnit.Millisecond);

  static TimeXt fromDuration(Duration duration, {TimeXtUnit unit: TimeXtUnit.Millisecond}) => TimeXt(duration.inMilliseconds.toDouble() * TimeXtUnit.Millisecond._value / unit._value, unit);
  Duration toDuration() => Duration(milliseconds: this.inMilliseconds().toInt());

  operator +(TimeXt other) => TimeXt(((this.inMilliseconds() + other.inMilliseconds()) / this._unit._value) * TimeXtUnit.Millisecond._value, this._unit);
  operator -(TimeXt other) => TimeXt(((this.inMilliseconds() - other.inMilliseconds()) / this._unit._value) * TimeXtUnit.Millisecond._value, this._unit);
  operator *(double other) => TimeXt(this._value * other, this._unit);
  operator /(double other) => TimeXt(this._value / other, this._unit);
  operator ==(other) => this.inMilliseconds() == other.inMilliseconds();
  operator >(other) => this.inMilliseconds() > other.inMilliseconds();
  operator <(other) => this.inMilliseconds() < other.inMilliseconds();

  @override int get hashCode => this.inMilliseconds().hashCode;
  @override String toString() => "$_value, $_unit";
}

class TimeXtUnit {
  final double _value;

  const TimeXtUnit._internal(this._value);

  @override String toString() => "$_value";

  static const Year = const TimeXtUnit._internal(365 * 24 * 60 * 60 * 1e3);
  static const Week = const TimeXtUnit._internal(7 * 24 * 60 * 60 * 1e3);
  static const Day = const TimeXtUnit._internal(24 * 60 * 60 * 1e3);
  static const Hour = const TimeXtUnit._internal(60 * 60 * 1e3);
  static const Minute = const TimeXtUnit._internal(60 * 1e3);
  static const Second = const TimeXtUnit._internal(1e3);
  static const Millisecond = const TimeXtUnit._internal(1e0);
}

class NumberToString {

  static List _dictionaryToStringList(Map<String, List<int>> dictionary, int time) {
    List stringList = [];
    dictionary.forEach((key, value) {
      var testValue = ((time / value.elementAt(0)) % value.elementAt(1)).floor();
      testValue > 1
          ? stringList.add("$testValue ${key}s")
          : testValue > 0
              ? stringList.add("$testValue $key")
              : stringList.add("");
    });
    return stringList.where((value) => value.length > 0).toList();
  }

  static String formatMilliseconds(int milliseconds) {
    var dictionary = {
      "week": [7 * 24 * 60 * 60 * 1000, 2 ^ 64],
      "day": [24 * 60 * 60 * 1000, 7],
      "hour": [60 * 60 * 1000, 24],
      "minute": [60 * 1000, 60],
      "second": [1000, 60],
      "millisecond": [1, 1000]
    };

    List stringList = _dictionaryToStringList(dictionary, milliseconds);
    return stringList.length > 0
        ? stringList.join(", ")
        : "0 milliseconds";
  }

  static String formatSeconds(int seconds) {
    var dictionary = {
      "week": [7 * 24 * 60 * 60 * 1, 2 ^ 64],
      "day": [24 * 60 * 60 * 1, 7],
      "hour": [60 * 60 * 1, 24],
      "minute": [60 * 1, 60],
      "second": [1, 60]
    };

    List stringList = _dictionaryToStringList(dictionary, seconds);
    return stringList.length > 0
        ? stringList.join(", ")
        : formatMilliseconds(seconds * 1000);
  }
  
  static String formatMinutes(int minutes) {
    var dictionary = {
      "week": [7 * 24 * 60 * 1, 2 ^ 64],
      "day": [24 * 60 * 1, 7],
      "hour": [60 * 1, 24],
      "minute": [1, 60]
    };

    List stringList = _dictionaryToStringList(dictionary, minutes);
    return stringList.length > 0
        ? stringList.join(", ")
        : formatSeconds(minutes * 60);
  }
  
  static String formatHours(int hours) {
    var dictionary = {
      "week": [7 * 24 * 1, 2 ^ 64],
      "day": [24 * 1, 7],
      "hour": [1, 24]
    };

    List stringList = _dictionaryToStringList(dictionary, hours);
    return stringList.length > 0
        ? stringList.join(", ")
        : formatMinutes(hours * 60);
  }
}
