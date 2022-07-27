import 'package:flutter/material.dart';
import 'package:worldtimeapp/pages/service/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> worldTimeList = [
    WorldTime(location: 'London', flag: 'london.png', url: 'Europe/London'),
    WorldTime(location: 'Athens', flag: 'athens.jpeg', url: 'Europe/Berlin'),
    WorldTime(location: 'Cairo', flag: 'egypt.png', url: 'Africa/Cairo'),
    WorldTime(
        location: 'Nairobi', flag: 'kenya-nairobi.png', url: 'Africa/Nairobi'),
    WorldTime(location: 'Chicago', flag: 'america.png', url: 'America/Chicago'),
    WorldTime(
        location: 'New York', flag: 'america.png', url: 'America/New_York'),
    WorldTime(
        location: 'North Dakota', flag: 'america.png', url: 'America/Phoenix'),
    WorldTime(location: 'Seoul', flag: 'seoul.png', url: 'Asia/Seoul'),
    WorldTime(location: 'Jakarta', flag: 'jakarta.webp', url: 'Asia/Jakarta'),
  ];

  void updateTime(index) async {
    WorldTime instance = worldTimeList[index];
    // use await to wait for the asynchronous function
    await instance.getTime();
    print(instance);

    // pops context and pushs data

    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isdaytime': instance.isDayTime,
    });

    print(instance.location);
  }

  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 0.0,
        title: const Text('Choose a Location'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
        child: ListView.builder(
            itemCount: worldTimeList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 3),
                child: Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    onTap: () {
                      updateTime(index);
                    },
                    title: Text(worldTimeList[index].location),
                    leading: CircleAvatar(
                        backgroundImage: AssetImage(
                            'lib/assets/${worldTimeList[index].flag}')),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
