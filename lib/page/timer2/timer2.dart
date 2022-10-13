import 'dart:async';

import 'package:boxe_app/page/home/home_Page.dart';
import 'package:flutter/material.dart';

class TimerPage2 extends StatefulWidget {
  @override
  _TimerPage2State createState() => _TimerPage2State();
}

class _TimerPage2State extends State<TimerPage2> {
    //timer
    late Timer _timer;

    //time controls
    int startTimer = 0;
    int _currentTime = 0;

    //text field and buttons
    TextEditingController _timerTextController = TextEditingController();
    String _btnText = "Começar!";

    bool _isTimerRunning = false;
    bool _isTextEnable = true;

    void _startTimer() {
        //start timer
        _setTimerStart();

        _timer = Timer.periodic(Duration(seconds: 1), (timer) { 
        
        if(_currentTime > 0) {
          //change current time
        _currentTime--;

        //set text field value
        _timerTextController.text = _currentTime.toString();

        } else {
          //stop timer
          _setTimerStop();
        
        }

        });
      ;
    }

    void _setTimerStart() {
      setState(() {
        bool _isTimerRunning = true;
        bool _isTextEnable = false;

        _btnText = "Pausar";
      });
    }

    void _setTimerStop() {
      setState(() {
        bool _isTimerRunning = false;
        bool _isTextEnable = true;

        _timer.cancel();
        _btnText = "Começar!";
      });
    }

    @override
    Widget build(BuildContext context){
      return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          
          //back button
          Padding(
          padding: const EdgeInsets.only(top: 18.0, left:18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BackButton(
                    color: Colors.white,
                    onPressed:() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => 
                                  const HomePage(),
                          )
                      );
                    },
                  ),
                ],
              ),
            ),


          SizedBox(
            height: 80,
          ),


          //logo
          Image.asset('assets/logo.png', height: 160.0,),

          SizedBox(
            height: 250,
          ),
          
          //timer text field
          TextField(
            enabled: _isTextEnable,
            controller: _timerTextController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "0",
              hintStyle: TextStyle(
              fontSize: 32, color: Colors.white.withAlpha(90)
              ),
            ),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),

          //space
          SizedBox(
            height: 32,
          ),

          // start button
          TextButton(onPressed: () {
            String _timerTextValue = _timerTextController.text.toString();
            if (_timerTextValue.isNotEmpty) {
               //get time
               int time = int.parse(_timerTextValue);

               //set time
               startTimer = time;
               _currentTime = time;
               _startTimer();
            }
          },
          child: Text(_btnText, style: TextStyle(color: Colors.white),),
          ),
        ]
      ),
    );
  }
} 