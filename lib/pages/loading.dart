import 'package:flutter/material.dart';
import 'package:worldtimeapp/pages/service/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setUpWordTime() async {
    WorldTime instance = WorldTime(
        location: 'North Dakota', flag: 'American', url: 'America/Phoenix');

    await instance.getTime();

    Future.delayed(Duration(milliseconds: 900), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isdaytime': instance.isDayTime,
      });
    });
  }

  @override
  void initState() {
    setUpWordTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[900],
        body: const Center(
          child: SpinKitFoldingCube(
            color: Colors.white,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}
