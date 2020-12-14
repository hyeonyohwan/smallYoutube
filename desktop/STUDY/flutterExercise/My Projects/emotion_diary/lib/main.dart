import 'package:flutter/material.dart';
import 'gradientText.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:carousel_slider/carousel_slider.dart';

int count = 0;
int current = 0;
double emotionScore = 50.0;

bool _isResetButtonDisabled = false; //리셋버튼을 회색으로 비활성화하기 위해서 false로 초기화

List<FlSpot> spots = [FlSpot(0.0, 50.0)]; //spots 초기화
List<FlSpot> avgSpots = [FlSpot(0.0, 0.0)]; //평균spots 초기화

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: EmotionChart(),
      ),
    );
  }
}

class EmotionChart extends StatefulWidget {
  @override
  _EmotionState createState() => _EmotionState();
}

class _EmotionState extends State<EmotionChart> {
  Widget _buildResetButton() {
    return new IconButton(
      icon: Icon(
        Icons.cached,
        color: _isResetButtonDisabled ? Colors.tealAccent : Colors.grey,
        size: 70.0,
      ),
      onPressed: () {
        setState(() {
          _resetButtonPress();
        });
        _isResetButtonDisabled = false;
      },
    );
  }

  void _resetButtonPress() {
    //리셋버튼을 누르면 리셋 메소드가 실행된다

    if (_isResetButtonDisabled) {
      reset(count, emotionScore);
    } else {
      return null;
    }
  }

  void spotsAdder() {
    //버튼이 눌려 점이 늘어날 때마다 리스트에 저장

    _isResetButtonDisabled = true; //점이 늘어나면 리셋버튼을 활성화시킨다
    if (emotionScore < 100 && emotionScore > 0.0) {
      if (spots.length <= 50) {
        spots.add(new FlSpot(count.toDouble(), emotionScore));
      }
    } else if (emotionScore >= 100) {
      spots.add(new FlSpot(count.toDouble(), 100.0));
    } else {
      spots.add(new FlSpot(count.toDouble(), 0.0));
    }
  }

  void avgSpotsAdder() {
    //버튼이 눌려 점이 늘어날 때마다 평균을 매겨 리스트에 저장

    _isResetButtonDisabled = true; //점이 늘어나면 리셋버튼을 활성화시킨다
    double sum = 0.0;
    sum = sum + emotionScore;
    if (count > 0) avgSpots.add(new FlSpot(count.toDouble(), sum / count));
  }

  void reset(int count, double emotionScore) {
    //차트 안에 반드시 초기화했을 때의 값이 있어야 한다.
    if (count >= 1) {
      //그러므로 clear사용 불가
      spots.removeRange(1, count + 1);
      avgSpots.removeRange(1, count + 1);
      count = 0;
      emotionScore = 0.0;
    } else {
      return;
    }
  }

  void setAlert() {
    if (emotionScore < 25) {
      Alert(
        context: context,
        type: AlertType.info,
        title: '좌절',
        desc:
            '모든 일이 안 풀리고 힘든 시기일 거에요. 하지만 이 시기를 이겨내면 앞으로 행복해질 수 있어요. 우리 좀만 더 힘내요',
      ).show();
    } else if (emotionScore < 50) {
      Alert(
        context: context,
        title: '우울',
        desc:
            '주변에 친한 사람들에게 고민을 털어도 되고 혼자 맛있는 음식을 먹으며 이쁜 곳을 돌아다녀 보세요. 기분이 훨씬 좋아질거에요.',
      ).show();
    } else if (emotionScore < 75) {
      Alert(
        context: context,
        title: '평범',
        desc: '조금만 더 긍정적으로 생각하고 하는 일에 노력한다면 전보다 행복한 삶을 살 수 있을 거에요. 화이팅!',
      ).show();
    } else if (emotionScore < 100) {
      Alert(
        context: context,
        title: '즐거움',
        desc: '요새 일도 잘 풀리고 기분도 좋아보이시네요. 앞으로도 좋은 일만 오고 행복한 삶이 될거에요.',
      ).show();
    } else {
      Alert(
        context: context,
        title: '행복',
        desc: '정말 많이 행복해보이시네요. 그 행복으로 주변 사람들도 행복하게 만들어 주세요. 아마 더 좋은 일이 생길 거에요.',
      ).show();
    }
  }

  void caseAlert() {
    if (count == 10) {
      setAlert();
    } else if (count == 20) {
      setAlert();
    } else if (count == 30) {
      setAlert();
    } else if (count == 40) {
      setAlert();
    } else if (count == 50) {
      setAlert();
    } else {
      return;
    }
  }

  void modules() {
    count++;
    spotsAdder();
    avgSpotsAdder();
    caseAlert();
  }

  List<Color> gradientColors = [
    const Color(0xff0f6d03),
    const Color(0xff6cff59),
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff3B4869), Color(0xff252E47)]),
          ),
        ),
        //TODO: 배경이미지 설정시 렉이 걸려서 잠시 주석
        Column(
          children: <Widget>[
            SizedBox(height: 40.0),
            GradientText(
              'Emotion Diary',
              gradient: LinearGradient(colors: [
                Colors.tealAccent,
                Colors.indigo,
                Colors.purple,
                Colors.white,
              ]),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CarouselSlider(
                    height: 200.0,
                    initialPage: 0,
                    enlargeCenterPage: true,
                    autoPlay: false,
                    reverse: false,
                    autoPlayInterval: Duration(seconds: 2),
                    autoPlayAnimationDuration: Duration(milliseconds: 2000),
                    enableInfiniteScroll: true,
                    pauseAutoPlayOnTouch: Duration(seconds: 10),
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index) {
                      setState(() {
                        current = index;
                      });
                    },
                    items: <Widget>[
                      Container(
                        width: 200.0,
                        child: Card(
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.pink,
                                  size: 100.0,
                                ),
                                onTap: () {
                                  setState(
                                    () {
                                      emotionScore = emotionScore + 3;
                                      modules();
                                    },
                                  );
                                },
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                '행복',
                                style: TextStyle(
                                  color: Colors.tealAccent,
                                  fontSize: 30.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 200.0,
                        child: Card(
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                child: Icon(
                                  Icons.sentiment_satisfied,
                                  color: Colors.orangeAccent,
                                  size: 100.0,
                                ),
                                onTap: () {
                                  setState(
                                    () {
                                      emotionScore = emotionScore + 2;
                                      modules();
                                    },
                                  );
                                },
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                '즐거움',
                                style: TextStyle(
                                  color: Colors.tealAccent,
                                  fontSize: 30.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 200.0,
                        child: Card(
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                child: Icon(
                                  Icons.cloud,
                                  color: Colors.yellowAccent,
                                  size: 100.0,
                                ),
                                onTap: () {
                                  setState(
                                    () {
                                      emotionScore = emotionScore + 1;
                                      modules();
                                    },
                                  );
                                },
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                '좋음',
                                style: TextStyle(
                                  color: Colors.tealAccent,
                                  fontSize: 30.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 200.0,
                        child: Card(
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                child: Icon(
                                  Icons.battery_alert,
                                  color: Colors.green,
                                  size: 100.0,
                                ),
                                onTap: () {
                                  setState(
                                    () {
                                      emotionScore = emotionScore + 0;
                                      modules();
                                    },
                                  );
                                },
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                '보통',
                                style: TextStyle(
                                  color: Colors.tealAccent,
                                  fontSize: 30.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 200.0,
                        child: Card(
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                child: Icon(
                                  Icons.mood_bad,
                                  color: Colors.blue,
                                  size: 100.0,
                                ),
                                onTap: () {
                                  setState(
                                    () {
                                      emotionScore = emotionScore - 1;
                                      modules();
                                    },
                                  );
                                },
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                '안 좋음',
                                style: TextStyle(
                                  color: Colors.tealAccent,
                                  fontSize: 30.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 200.0,
                        child: Card(
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                child: Icon(
                                  Icons.sentiment_very_dissatisfied,
                                  color: Colors.indigoAccent,
                                  size: 100.0,
                                ),
                                onTap: () {
                                  setState(
                                    () {
                                      emotionScore = emotionScore - 2;
                                      modules();
                                    },
                                  );
                                },
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                '우울',
                                style: TextStyle(
                                  color: Colors.tealAccent,
                                  fontSize: 30.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 200.0,
                        child: Card(
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                child: Icon(
                                  Icons.warning,
                                  color: Colors.deepPurpleAccent,
                                  size: 100.0,
                                ),
                                onTap: () {
                                  setState(
                                    () {
                                      emotionScore = emotionScore - 3;
                                      modules();
                                    },
                                  );
                                },
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                '슬픔',
                                style: TextStyle(
                                  color: Colors.tealAccent,
                                  fontSize: 30.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            AspectRatio(
              aspectRatio: 1.70,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(18),
                  ),
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Color(0xff2a324c), Color(0xff333e61)]),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 18.0, left: 12.0, top: 24, bottom: 12),
                  child: LineChart(
                    showAvg ? avgData() : mainData(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(    //평균 버튼 컨테이너
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(18),
                ),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Color(0xff2a324c), Color(0xff0d92B6)]),
              ),
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    showAvg = !showAvg;
                  });
                },
                child: Text(
                  '평균',
                  style: TextStyle(
                      fontSize: 40,
                      color: showAvg
                          ? Colors.indigo[200].withOpacity(0.5)
                          : Colors.indigo[200]),
                ),
              ),
            ),
            Container(    //점수 합계 컨테이너
            //TODO: 토탈 원그래프 만들기
            //TODO: singlechildscrollview를 통해서 화면스크롤 되게 만들기
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(18),
                ),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Color(0xff2a324c), Color(0xffc6689b)]),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Total : $emotionScore',
                    style: TextStyle(fontSize: 50.0, color: Color(0xffa37fe6))),
              ),
              margin: EdgeInsets.all(20.0),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 30.0,
                right: 40.0,
              ),
              child: _buildResetButton(),
            ),
          ],
        )
      ],
    );
  }

  LineChartData mainData() {
    Container(
      child: Text(
        '감정그래프',
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
    );

    return LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.black54,
            strokeWidth: 50,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.black54,
            strokeWidth: 50,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          textStyle: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 10:
                return '10회';
              case 20:
                return '20회';
              case 30:
                return '30회';
              case 40:
                return '40회';
              case 50:
                return '50회';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '좌절';
              case 25:
                return '우울';
              case 50:
                return '평범';
              case 75:
                return '좋음';
              case 100:
                return '행복';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 50,
      minY: 0,
      maxY: 100,
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          colors: gradientColors,
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.25)).toList(),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    //TODO: 평균 그래프 아직 구현 못함
    return LineChartData(
      lineTouchData: const LineTouchData(enabled: false),
      gridData: FlGridData(
        show: false,
        drawHorizontalLine: true,
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.black54,
            strokeWidth: 50,
          );
        },
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.black54,
            strokeWidth: 50,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          textStyle: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 10:
                return '10회';
              case 20:
                return '20회';
              case 30:
                return '30회';
              case 40:
                return '40회';
              case 50:
                return '50회';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case -50:
                return '좌절';
              case -25:
                return '우울';
              case 0:
                return '평범';
              case 25:
                return '좋음';
              case 50:
                return '행복';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 50,
      minY: -50,
      maxY: 50,
      lineBarsData: [
        LineChartBarData(
          spots: avgSpots,
          isCurved: true,
          colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2),
          ],
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: true, colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)
                .withOpacity(0.1),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)
                .withOpacity(0.1),
          ]),
        ),
      ],
    );
  }
}
