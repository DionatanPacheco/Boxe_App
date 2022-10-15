import 'dart:async';

import 'package:boxe_app/page/home/home_Page.dart';
import 'package:boxe_app/page/timer2/timer_progress_loader.dart';
import 'package:flutter/material.dart';

class TimerPage2 extends StatefulWidget {
  @override
  _TimerPage2State createState() => _TimerPage2State();
}

class _TimerPage2State extends State<TimerPage2> {
  //space
  double space = 40;

  //timer
  late Timer _timer;

  //time controls
  int startTimer = 0;
  int _currentTime = 0;
  int rounds = 1;
  int rest = 1;

  //round and rest time
  final TextEditingController _roundTextController = TextEditingController();
  final TextEditingController _restTextController = TextEditingController();

  //text field and buttons
  final TextEditingController _timerTextController = TextEditingController();
  String _btnText = "COMEÇAR";

  var _isTimerRunning = false;
  var _isTextEnable = true;

  void _startTimer() {
    //start timer
    _setTimerStart();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_currentTime > 0) {
        //change current time
        _currentTime--;

        //set round, rest and time text field value
        _timerTextController.text = _currentTime.toString();
        _roundTextController.text = rounds.toString();
        _restTextController.text = rest.toString();
      } else {
        //stop timer
        _setTimerStop();
      }
    });
  }

  void _setTimerStart() {
    setState(() {
      _isTimerRunning = true;
      _isTextEnable = false;

      _btnText = "PARAR";
    });
  }

  void _setTimerStop() {
    setState(() {
      _timerTextController.text = "";

      _isTimerRunning = false;
      _isTextEnable = true;

      _timer.cancel();
      _btnText = "COMEÇAR";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.withOpacity(0.99),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        //back button
        Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BackButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ));
                },
              ),
            ],
          ),
        ),

        SizedBox(
          height: space - 36,
        ),

        //logo
        Image.asset(
          'assets/logo.png',
          height: 120.0,
        ),

        SizedBox(
          height: space,
        ),

        //timer text information

        Padding(
          padding: const EdgeInsets.only(
            left: 48.0,
            right: 48.0,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Center(
                      child: Container(
                        child: const Text(
                          " Nº  R O U N D S",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Center(
                      child: Container(
                        child: TextField(
                          enabled: _isTextEnable,
                          controller: _roundTextController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "clique aqui",
                            hintStyle: TextStyle(
                              fontFamily: 'Nunito',
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 15.0,
                            ),
                          ),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 23.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: space - 20,
                ),
                Column(
                  children: [
                    Center(
                      child: Container(
                        child: const Text(
                          "D E S C A N S O",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Center(
                      child: Text(
                        "EM MIN.",
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 12.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Center(
                      child: Container(
                        child: TextField(
                          enabled: _isTextEnable,
                          controller: _restTextController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "clique aqui",
                            hintStyle: TextStyle(
                                fontFamily: 'Nunito',
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 15.0),
                          ),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 23.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        SizedBox(
          height: space - 16,
        ),

        const Center(
          child: Text(
            "TEMPO EM CADA ROUND:",
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),

        const Center(
          child: Text(
            "EM MIN.",
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 13.0,
              color: Colors.white,
            ),
          ),
        ),

        SizedBox(
          height: space - 19,
        ),

        //timer container, with text field and loading animation
        Stack(
          children: [
            //loading animation
            Center(child: TimerProgressLoader()),

            //timer text field
            Center(
              child: Container(
                height: 200,
                width: 200,
                alignment: Alignment.center,
                child: TextField(
                  enabled: _isTextEnable,
                  controller: _timerTextController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "clique aqui",
                    hintStyle: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 20,
                        color: Colors.white.withAlpha(90)),
                  ),
                  style: const TextStyle(
                      fontFamily: 'Nunito', fontSize: 32, color: Colors.white),
                ),
              ),
            ),
          ],
        ),

        //space
        SizedBox(
          height: space - 18,
        ),

        // start/stop button
        TextButton(
          onPressed: () {
            //check if time is already running
            if (!_isTimerRunning) {
              String _timerTextValue = _timerTextController.text.toString();
              if (_timerTextValue.isNotEmpty) {
                //get time
                int time = int.parse(_timerTextValue);

                //set time
                startTimer = time;
                _currentTime = time;
                _startTimer();
              }
            } else {
              _setTimerStop();
            }
          },
          child: Text(
            _btnText,
            style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.w400),
          ),
        ),
      ]),
    );
  }
}
