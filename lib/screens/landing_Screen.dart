import 'package:flutter/material.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../utils/constants.dart';
import '../utils/widget_functions.dart';

class FeelingsScreen extends StatefulWidget {
  const FeelingsScreen({Key key}) : super(key: key);

  @override
  State<FeelingsScreen> createState() => _FeelingsScreenState();
}

class _FeelingsScreenState extends State<FeelingsScreen> {
  YoutubePlayerController _ytbPlayerController;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    const double padding = 25;
    final sidePadding = const EdgeInsets.symmetric(horizontal: padding);
    String videoID = 'ml6cT4AZdqI';
    // YouTube Video Full URL : https://www.youtube.com/watch?v=ml6cT4AZdqI

    return SafeArea(
        child: Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  addVerticalSpace(padding),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_back_ios_outlined)),
                      const SizedBox(
                        width: 55,
                      ),
                      Text(
                        "Your Feelings History",
                        style: themeData.textTheme.headline3,
                      )
                    ],
                  ),
                  // addVerticalSpace(10),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: ["30%", "10%", "40%", "1%", "0%", "0%", "0%"]
                          .map((filter) => ChoiceOption(
                                text: filter,
                              ))
                          .toList(),
                    ),
                  ),
                  // addVerticalSpace(padding),
                  Padding(
                    padding: sidePadding,
                    child: const Divider(
                      height: padding,
                      color: COLOR_GREY,
                    ),
                  ),
                  Padding(
                    padding: sidePadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              color: COLOR_BLUE.withAlpha(155)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          child: Text(
                            getCurrentDate(),
                            style: themeData.textTheme.headline5,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        WeekView()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: sidePadding,
                    child: const Divider(
                      height: padding,
                      color: COLOR_GREY,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: sidePadding,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("9AM", style: themeData.textTheme.headline5),
                            Text(" - 12PM",
                                style: themeData.textTheme.headline5),
                            addHorizontalSpace(45),
                            Text("🥰 Love",
                                style: themeData.textTheme.headline4)
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text("1PM", style: themeData.textTheme.headline5),
                            Text(" - 4PM ",
                                style: themeData.textTheme.headline5),
                            addHorizontalSpace(45),
                            Text("😡 Angry",
                                style: themeData.textTheme.headline4)
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text("4PM", style: themeData.textTheme.headline5),
                            Text(" - 6PM ",
                                style: themeData.textTheme.headline5),
                            addHorizontalSpace(45),
                            Text("😡 Angry",
                                style: themeData.textTheme.headline4)
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: sidePadding,
                    child: const Divider(
                      height: padding,
                      color: COLOR_GREY,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: sidePadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "You May Find Interesting",
                          style: themeData.textTheme.headline4,
                        ),
                        Text(
                          "$Description",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class WeekView extends StatelessWidget {
  const WeekView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HorizontalCalendar(
      date: DateTime.now(),
      textColor: Colors.black45,
      backgroundColor: Colors.white,
      selectedColor: Colors.black,
      onDateSelected: (date) => print(
        date.toString(),
      ),
    );
  }
}

getCurrentDate() {
  var date = DateTime.now().toString();

  var dateParse = DateTime.parse(date);

  var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

  return formattedDate;
}

class ChoiceOption extends StatelessWidget {
  final String text;
  final String text2;
  const ChoiceOption({Key key, @required this.text, this.text2})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    dynamic text2;
    final ThemeData themeData = Theme.of(context);
    if (text == 'Energetic') {
      text2 = '⚡️';
    } else if (text == 'Sad') {
      text2 = '️😪';
    } else if (text == 'Happy') {
      text2 = '😄️';
    } else if (text == 'Angry') {
      text2 = '😡️';
    } else if (text == 'Calm') {
      text2 = '🍃';
    } else if (text == 'Bored') {
      text2 = '😐️';
    } else if (text == 'Love') {
      text2 = '🥰️';
    }
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: COLOR_GREY.withAlpha(25)),
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
      margin: const EdgeInsets.only(left: 25),
      child: Column(
        children: [
          Text(
            text,
            style: themeData.textTheme.headline5,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            // padding: EdgeInsets.all(10),
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  color: GREEN, borderRadius: BorderRadius.circular(40)
                  //more than 50% of width makes circle
                  ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("⚡️"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
