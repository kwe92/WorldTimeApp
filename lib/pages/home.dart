import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[200],
          body: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                  onPressed: () {
                    // A Navigator class that
                    Navigator.pushNamed(context, '/location');
                  },
                  icon: const Icon(Icons.edit_location),
                  label: const Text("Edit Location"),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(fontSize: 25),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
