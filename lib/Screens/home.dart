import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';
import '../API_connection/api.dart';
import 'cards.dart';

class CardsClass extends StatefulWidget {
  @override
  _CardsClassState createState() => new _CardsClassState();
}

class _CardsClassState extends State<CardsClass> {
  var currentPage = estados.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: estados.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color(0xFF1b1e44),
              Color(0xFF2d3447),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            tileMode: TileMode.clamp),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "CovidBR",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 46.0,
                        fontFamily: "Calibre-Semibold",
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Cards",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontFamily: "Calibre-Semibold",
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      CardScrollWidget(currentPage),
                      Positioned.fill(
                        child: PageView.builder(
                          itemCount: estados.length,
                          controller: controller,
                          reverse: true,
                          itemBuilder: (context, index) {
                            return Container();
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Gráficos (Brasil)",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontFamily: "Calibre-Semibold",
                            letterSpacing: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          height: 500,
                          width: 500,
                          child: Material(
                            color: Colors.purple[400],
                            elevation: 14.0,
                            borderRadius: BorderRadius.circular(16.0),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Casos nos últimos 7 dias",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Color(0xFF2d3447),
                                        fontFamily: "Calibre-Semibold",
                                        letterSpacing: 1.0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                      width: 400.0,
                                      height: 400.0,
                                      child: BezierChart(
                                        bezierChartScale:
                                            BezierChartScale.CUSTOM,
                                        xAxisCustomValues: const [
                                          1,
                                          2,
                                          3,
                                          4,
                                          5,
                                          6,
                                          7
                                        ],
                                        series: [
                                          BezierLine(
                                            label: "casos",
                                            data: [
                                              DataPoint<double>(
                                                  value: cases[0], xAxis: 1),
                                              DataPoint<double>(
                                                  value: cases[1], xAxis: 2),
                                              DataPoint<double>(
                                                  value: cases[2], xAxis: 3),
                                              DataPoint<double>(
                                                  value: cases[3], xAxis: 4),
                                              DataPoint<double>(
                                                  value: cases[4], xAxis: 5),
                                              DataPoint<double>(
                                                  value: cases[5], xAxis: 6),
                                              DataPoint<double>(
                                                  value: cases[6], xAxis: 7),
                                            ],
                                          ),
                                        ],
                                        config: BezierChartConfig(
                                          verticalIndicatorColor: Colors.white,
                                          backgroundColor: Colors.purple[400],
                                          bubbleIndicatorTitleStyle: TextStyle(
                                            color: Colors.transparent,
                                          ),
                                          xAxisTextStyle: TextStyle(
                                            color: Colors.transparent,
                                          ),
                                          snap: false,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Container(
                          width: 500.0,
                          height: 500.0,
                          child: Material(
                            color: Colors.purple[400],
                            elevation: 14.0,
                            borderRadius: BorderRadius.circular(16.0),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Mortes nos últimos 7 dias",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Color(0xFF2d3447),
                                        fontFamily: "Calibre-Semibold",
                                        letterSpacing: 1.0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                      width: 400.0,
                                      height: 400.0,
                                      child: BezierChart(
                                        bezierChartScale:
                                            BezierChartScale.CUSTOM,
                                        xAxisCustomValues: const [
                                          1,
                                          2,
                                          3,
                                          4,
                                          5,
                                          6,
                                          7
                                        ],
                                        series: [
                                          BezierLine(
                                            label: "mortes",
                                            data: [
                                              DataPoint<double>(
                                                  value: deaths[0], xAxis: 1),
                                              DataPoint<double>(
                                                  value: deaths[1], xAxis: 2),
                                              DataPoint<double>(
                                                  value: deaths[2], xAxis: 3),
                                              DataPoint<double>(
                                                  value: deaths[3], xAxis: 4),
                                              DataPoint<double>(
                                                  value: deaths[4], xAxis: 5),
                                              DataPoint<double>(
                                                  value: deaths[5], xAxis: 6),
                                              DataPoint<double>(
                                                  value: deaths[6], xAxis: 7),
                                            ],
                                          ),
                                        ],
                                        config: BezierChartConfig(
                                          verticalIndicatorColor: Colors.white,
                                          backgroundColor: Colors.purple[400],
                                          bubbleIndicatorTitleStyle: TextStyle(
                                            color: Colors.transparent,
                                          ),
                                          xAxisTextStyle: TextStyle(
                                            color: Colors.transparent,
                                          ),
                                          snap: false,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
