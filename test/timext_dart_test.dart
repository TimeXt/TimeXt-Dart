import 'package:flutter_test/flutter_test.dart';

import 'package:timext_dart/timext_dart.dart';

void main() {
  test('All comparisons should work as expected', () {
    expect(new TimeXt(2, TimeXtUnit.Year), new TimeXt(730, TimeXtUnit.Day));
    expect(new TimeXt(3, TimeXtUnit.Year) > new TimeXt(20, TimeXtUnit.Day), true);
    expect(new TimeXt(0.5, TimeXtUnit.Year) < new TimeXt(200, TimeXtUnit.Day), true);

    expect(new TimeXt(2, TimeXtUnit.Week), new TimeXt(14, TimeXtUnit.Day));
    expect(new TimeXt(3, TimeXtUnit.Week) > new TimeXt(20, TimeXtUnit.Day), true);
    expect(new TimeXt(4, TimeXtUnit.Week) < new TimeXt(29, TimeXtUnit.Day), true);

    expect(new TimeXt(2, TimeXtUnit.Day), new TimeXt(48, TimeXtUnit.Hour));
    expect(new TimeXt(1, TimeXtUnit.Day) > new TimeXt(23, TimeXtUnit.Hour), true);
    expect(new TimeXt(0, TimeXtUnit.Day) < new TimeXt(1, TimeXtUnit.Hour), true);

    expect(new TimeXt(2, TimeXtUnit.Hour), new TimeXt(120, TimeXtUnit.Minute));
    expect(new TimeXt(3, TimeXtUnit.Hour) > new TimeXt(179, TimeXtUnit.Minute), true);
    expect(new TimeXt(5, TimeXtUnit.Hour) < new TimeXt(301, TimeXtUnit.Minute), true);

    expect(new TimeXt(15, TimeXtUnit.Minute), new TimeXt(900, TimeXtUnit.Second));
    expect(new TimeXt(30, TimeXtUnit.Minute) > new TimeXt(1799, TimeXtUnit.Second), true);
    expect(new TimeXt(45, TimeXtUnit.Minute) < new TimeXt(2701, TimeXtUnit.Second), true);

    expect(new TimeXt(10, TimeXtUnit.Second), new TimeXt(10000, TimeXtUnit.Millisecond));
    expect(new TimeXt(20, TimeXtUnit.Second) > new TimeXt(19999, TimeXtUnit.Millisecond), true);
    expect(new TimeXt(30, TimeXtUnit.Second) < new TimeXt(30001, TimeXtUnit.Millisecond), true);
  });

  test('All conversions should work as expected', () {
    expect(new TimeXt(1, TimeXtUnit.Year).inDays(), 365);
    expect(new TimeXt(14, TimeXtUnit.Day).inWeeks(), 2);
    expect(new TimeXt(17520, TimeXtUnit.Hour).inYears(), 2);
    expect(new TimeXt(5.5, TimeXtUnit.Minute).inSeconds(), 330);
    expect(new TimeXt(1.52, TimeXtUnit.Second).inMilliseconds(), 1520);
    expect(new TimeXt(30000, TimeXtUnit.Millisecond).inMinutes(), 0.5);
  });

  test('All casts should work as expected', () {
    expect(new TimeXt(1, TimeXtUnit.Year).toDays(), new TimeXt(365, TimeXtUnit.Day));
    expect(new TimeXt(14, TimeXtUnit.Day).toWeeks(), new TimeXt(2, TimeXtUnit.Week));
    expect(new TimeXt(17520, TimeXtUnit.Hour).toYears(), new TimeXt(2, TimeXtUnit.Year));
    expect(new TimeXt(5.5, TimeXtUnit.Minute).toSeconds(), new TimeXt(330, TimeXtUnit.Second));
    expect(new TimeXt(1.52, TimeXtUnit.Second).toMilliseconds(), new TimeXt(1520, TimeXtUnit.Millisecond));
    expect(new TimeXt(30000, TimeXtUnit.Millisecond).toMinutes(), new TimeXt(0.5, TimeXtUnit.Minute));
  });

  test('Duration casts should work as expected', () {
    expect(TimeXt.fromDuration(Duration(minutes: 1), unit: TimeXtUnit.Second), new TimeXt(60, TimeXtUnit.Second));
    expect(new TimeXt(60, TimeXtUnit.Second).toDuration(), Duration(milliseconds: 60000));
  });
}
