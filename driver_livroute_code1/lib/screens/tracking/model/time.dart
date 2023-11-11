import 'package:liveroute/headers.dart';
import 'package:intl/intl.dart';

class Time {
  final TimeOfDay time;
  int get hour => time.hour;
  int get minute => time.minute;

  Time({required this.time});
  Time.timeOfDay({required int hour, required int minute})
      : time = TimeOfDay(hour: hour, minute: minute);
  Time.fromString(String sTime) : time = stringToTimeOfDay(sTime);
  @override
  String toString() => timeOfDayToString(time);

  static String timeOfDayToString(TimeOfDay time) {
    final now = DateTime.now().toLocal();
    final dateTime =
        DateTime(now.year, now.month, now.day, time.hour, time.minute)
            .toLocal();
    final formatter = DateFormat('h:mm a');
    return formatter.format(dateTime);
  }

  static String dateTimeToString(DateTime dateTime) {
    final formatter = DateFormat('h:mm a');
    return formatter.format(dateTime);
  }

// Convert string to TimeOfDay
  static TimeOfDay stringToTimeOfDay(String timeString) {
    final formatter = DateFormat('h:mm a');
    final dateTime = formatter.parse(timeString).toLocal();
    return TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
  }

  static String formatTime(int hour, int minute) {
    final period = hour < 12 ? 'AM' : 'PM';
    final hourString = (hour % 12).toString().padLeft(2, '0');
    final minuteString = minute.toString().padLeft(2, '0');
    return '$hourString:$minuteString $period';
  }
}
