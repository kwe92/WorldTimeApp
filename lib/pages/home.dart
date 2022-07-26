import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  // todo: Set background image based on the the value if isDayTime in the data map/dictionary

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    print('data variable: $data');

    var bgImage = data.values.elementAt(3)
        ? 'lib/assets/dayTime.webp'
        : 'lib/assets/nightTime.jpeg';

    Color bgColor = data.values.elementAt(3)
        ? const Color.fromRGBO(62, 126, 188, 1)
        : const Color.fromRGBO(2, 23, 84, 1);

    return Scaffold(
      /*
          appBar: AppBar(
          backgroundColor: bgColor //Color.fromRGBO(15, 61, 110, 1)
          ,
          title: const Text(
            'World Time App',
            style: TextStyle(fontSize: 24.0),
          )),
          */
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(bgImage),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                  onPressed: () {
                    // A Navigator class that
                    Navigator.pushNamed(context, '/location');
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: const Text(
                    "Edit Location",
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: const TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          letterSpacing: 2.0),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(data['time'],
                    style: const TextStyle(fontSize: 66.0, color: Colors.white))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
