import 'package:flutter/material.dart';
import 'package:floating_search_bar/floating_search_bar.dart';

//TODO: 맵은 화면 70%정도 사용하고 나머지 화면은 출발지 도착지 검색하게 구성

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: HereIsTheMap(),
        backgroundColor: Color(0xff010304),
      ),
    );
  }
}

class HereIsTheMap extends StatefulWidget {
  @override
  _HereIsTheMapState createState() => _HereIsTheMapState();
}

class _HereIsTheMapState extends State<HereIsTheMap> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: 400,
              height: 600,
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                color: Color(0xff1D3849),
                border: Border.all(
                  color: Color(0xff188FD0),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  ButtonBar(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(
                            color: Color(0xff188FD0),
                          ),
                        ),
                        child: const Text(
                          'push',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: null,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
