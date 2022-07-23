import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

// Location, Time, Flag Url
class WorldTime {
  late String location;
  late String time;
  String flag;
  String url;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      var url = Uri.parse('https://worldtimeapi.org/api/timezone/${this.url}');
      Response response = await get(url);

      Map timeData = jsonDecode(response.body);

      DateTime now = DateTime.parse(timeData['datetime']);
      String offset = timeData['utc_offset'].substring(1, 3);

      now = now.add(Duration(hours: int.parse(offset)));

      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Caught error message: $e');
    }
  }
}
