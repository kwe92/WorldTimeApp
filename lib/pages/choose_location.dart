import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  var _count = 0;

  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 0.0,
        title: Text('Choose a Location'),
      ),
      body: ElevatedButton(
        onPressed: () {
          setState(() {
            _count += 1;
          });
        },
        child: Text('Count: $_count'),
      ),
    );
  }
}
