import 'package:flutter_test/flutter_test.dart';

import 'package:timext_dart/timext_dart.dart';

void main() {
  test('All comparisons should work as expected', () {
    expect(new TimeXt(2, TimeXtUnit.Century), new TimeXt(20, TimeXtUnit.Decade));
    expect(new TimeXt(3, TimeXtUnit.Century) > new TimeXt(20, TimeXtUnit.Decade), true);
    expect(new TimeXt(0.5, TimeXtUnit.Century) < new TimeXt(10, TimeXtUnit.Decade), true);

    expect(new TimeXt(2, TimeXtUnit.Decade), new TimeXt(20, TimeXtUnit.Year));
    expect(new TimeXt(3, TimeXtUnit.Decade) > new TimeXt(20, TimeXtUnit.Year), true);
    expect(new TimeXt(0.5, TimeXtUnit.Decade) < new TimeXt(10, TimeXtUnit.Year), true);

    expect(new TimeXt(2, TimeXtUnit.Year), new TimeXt(730.5, TimeXtUnit.Day));
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

    expect(new TimeXt(10, TimeXtUnit.Second), new TimeXt(10000, TimeXtUnit.Millis));
    expect(new TimeXt(20, TimeXtUnit.Second) > new TimeXt(19999, TimeXtUnit.Millis), true);
    expect(new TimeXt(30, TimeXtUnit.Second) < new TimeXt(30001, TimeXtUnit.Millis), true);
  });

  test('All conversions should work as expected', () {
    expect(new TimeXt(1, TimeXtUnit.Century).inDecades(), 10);
    expect(new TimeXt(1, TimeXtUnit.Decade).inYears(), 10);
    expect(new TimeXt(1, TimeXtUnit.Year).inDays(), 365.25);
    expect(new TimeXt(14, TimeXtUnit.Day).inWeeks(), 2);
    expect(new TimeXt(8766, TimeXtUnit.Hour).inYears(), 1);
    expect(new TimeXt(5.5, TimeXtUnit.Minute).inSeconds(), 330);
    expect(new TimeXt(1.52, TimeXtUnit.Second).inMillis(), 1520);
    expect(new TimeXt(30000, TimeXtUnit.Millis).inMinutes(), 0.5);
  });

  test('All casts should work as expected', () {
    expect(new TimeXt(1, TimeXtUnit.Century).toDecades(), new TimeXt(10, TimeXtUnit.Decade));
    expect(new TimeXt(1, TimeXtUnit.Decade).toYears(), new TimeXt(10, TimeXtUnit.Year));
    expect(new TimeXt(1, TimeXtUnit.Year).toDays(), new TimeXt(365.25, TimeXtUnit.Day));
    expect(new TimeXt(14, TimeXtUnit.Day).toWeeks(), new TimeXt(2, TimeXtUnit.Week));
    expect(new TimeXt(8766, TimeXtUnit.Hour).toYears(), new TimeXt(1, TimeXtUnit.Year));
    expect(new TimeXt(5.5, TimeXtUnit.Minute).toSeconds(), new TimeXt(330, TimeXtUnit.Second));
    expect(new TimeXt(1.52, TimeXtUnit.Second).toMillis(), new TimeXt(1520, TimeXtUnit.Millis));
    expect(new TimeXt(30000, TimeXtUnit.Millis).toMinutes(), new TimeXt(0.5, TimeXtUnit.Minute));
  });

  test('Duration casts should work as expected', () {
    expect(TimeXt.fromDuration(Duration(minutes: 1), unit: TimeXtUnit.Second), new TimeXt(60, TimeXtUnit.Second));
    expect(new TimeXt(60, TimeXtUnit.Second).toDuration(), Duration(milliseconds: 60000));
  });

  test('All NumberToString methods should work as expected', () {
    expect(NumberToString.formatMillis(0), "0 milliseconds");
    expect(NumberToString.formatSeconds(0), "0 milliseconds");
    expect(NumberToString.formatMinutes(0), "0 milliseconds");
    expect(NumberToString.formatHours(0), "0 milliseconds");
    expect(NumberToString.formatDays(0), "0 milliseconds");
    expect(NumberToString.formatWeeks(0), "0 milliseconds");

    expect(NumberToString.formatMillis(34325055574), "56 weeks, 5 days, 6 hours, 44 minutes, 15 seconds, 574 milliseconds");
    expect(NumberToString.formatSeconds(4350554), "7 weeks, 1 day, 8 hours, 29 minutes, 14 seconds");
    expect(NumberToString.formatSeconds(90.250), "1 minute, 30 seconds, 250 milliseconds");
    expect(NumberToString.formatMinutes(432555), "42 weeks, 6 days, 9 hours, 15 minutes");
    expect(NumberToString.formatMinutes(0.5), "30 seconds");
    expect(NumberToString.formatHours(4574), "27 weeks, 1 day, 14 hours");
    expect(NumberToString.formatHours(49.25), "2 days, 1 hour, 15 minutes");
    expect(NumberToString.formatDays(23), "3 weeks, 2 days");
    expect(NumberToString.formatDays(15.5), "2 weeks, 1 day, 12 hours");
    expect(NumberToString.formatWeeks(23), "23 weeks");
    expect(NumberToString.formatWeeks(15.5), "15 weeks, 3 days, 12 hours");
  });
}
