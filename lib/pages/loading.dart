import 'package:flutter/material.dart';
import 'package:worldtimeapp/pages/service/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
// todo: Separate widgets into their own module

  void setUpWordTime() async {
    WorldTime instance = WorldTime(
        location: 'North Dakota', flag: 'American', url: 'America/Phoenix');

    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time
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
            appBar: AppBar(title: Text('Loading')),
            body: Center(child: Text('Loading'))));
  }
}
