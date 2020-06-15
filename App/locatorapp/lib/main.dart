import 'package:flutter/material.dart';
import 'UI/mapspage/maps_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Locator 0.0.1',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      color: Colors.yellow,
      home: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: new Scaffold(
            body: TabBarView(
              children: [
                new Container( // home page
                  color: Colors.yellow,
                ),
                new Container( // devices page
                  color: Colors.orange,
                ),
                new Container( // maps page
                  color: Colors.lightGreen,
                  child: MapsPage(),
                ),
                new Container( // settings page
                  color: Colors.red,
                ),
              ],
            ),
            //bottomNavigationBar: new TabBar(
            appBar: new TabBar(
              tabs: [
                Tab(
                  icon: new Icon(Icons.home),
                ),
                Tab(
                  icon: new Icon(Icons.perm_identity),
                ),
                Tab(
                  icon: new Icon(Icons.map),
                ),
                Tab(
                  icon: new Icon(Icons.settings),
                )
              ],
              labelColor: Colors.yellow,
              unselectedLabelColor: Colors.blue,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.all(5.0),
              indicatorColor: Colors.red,
            ),
            backgroundColor: Colors.black,
          ),
        ),
      ),
    );
  }
}
