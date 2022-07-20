import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
// todo: Separate widgets into their own module
// todo:

  void getTime() async {
    var url = Uri.parse(
        'https://worldtimeapi.org/api/timezone/America/North_Dakota/Center');
    Response response = await get(url);
    Map timeData = jsonDecode(response.body);

    DateTime now = DateTime.parse(timeData['datetime']);
    String offset = timeData['utc_offset'].substring(1, 3);

    print(now);
    print(offset);
    now = now.add(Duration(hours: int.parse(offset)));
    print(now);
  }

  @override
  void initState() {
    getTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text("Loading Screen"));
  }
}
