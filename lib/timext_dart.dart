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

  operator +(TimeXt other) => TimeXt(((this.inMilliseconds() + other.inMilliseconds()) / this._unit._value) * TimeXtUnit.Millisecond._value, this._unit);
  operator -(TimeXt other) => TimeXt(((this.inMilliseconds() - other.inMilliseconds()) / this._unit._value) * TimeXtUnit.Millisecond._value, this._unit);
  operator *(double other) => TimeXt(this._value * other, this._unit);
  operator /(double other) => TimeXt(this._value / other, this._unit);
  operator ==(other) => this.inMilliseconds() == other.inMilliseconds();

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
