import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: '이미지 연습',
    home: Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text('이미지 배치'),
      ),
      body: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width ~/ 2;

    return Column(
      children: <Widget>[
        makeRow('images/elsa.png', 'images/anna.png', width: width.toDouble()),
        makeRow('images/olaf.png', 'images/diamond.png',
            width: width.toDouble()),
      ],
    );
  }

  Widget makeRow(String leftPath, String rightPath, {double width}) {
    return Row(
      children: <Widget>[
        Container(
          child: Image.asset(leftPath, width: width - 10, height: width - 10),
          padding: EdgeInsets.all(5.0),
        ),
        Container(
          child: Image.asset(rightPath, width: width - 10, height: width - 10),
          padding: EdgeInsets.all(5.0),
        ),
      ],
    );
  }
}
