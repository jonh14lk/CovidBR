import 'package:flutter/material.dart';
import 'dart:math';
import '../Connection/connection.dart';

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;
var width, height;

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        width = contraints.maxWidth;
        height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = new List();

        for (var i = 0; i < estados.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(3.0, 6.0),
                      blurRadius: 10.0)
                ]),
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset("assets/image_01.jpg", fit: BoxFit.cover),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Text(estados[i].state,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.0,
                                    fontFamily: "SF-Pro-Text-Regular",
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Text('Cases:',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontFamily: "SF-Pro-Text-Regular")),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Text(estados[i].cases.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontFamily: "SF-Pro-Text-Regular")),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Text('Deaths:',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontFamily: "SF-Pro-Text-Regular")),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Text(estados[i].deaths.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontFamily: "SF-Pro-Text-Regular")),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}
