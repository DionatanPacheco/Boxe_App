import 'dart:async';

import 'package:boxe_app/page/home/home_Page.dart';
import 'package:boxe_app/page/loguin/loguin_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {

  int Time = 0;
  double percent = 0;
  static int TimeInMinut = 25;
  int TimeInSec =  TimeInMinut * 60; 

  late Timer timer;

  // final TextEditingController NumRounds = TextEditingController();
  // String NumRounds = "0";

  _startTimer(){
    TimeInMinut = 25;
    int Time = TimeInMinut;
    double SecPercent = (Time/100);
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if(Time > 0){
          Time--;
          if (Time % 60 == 0){
            TimeInMinut--;
          } if (Time % SecPercent == 0){
            if(percent<1){
              percent += 0.01;
            } else {
              percent = 1;
            }
          }
        } else {
          percent = 0;
          TimeInMinut = 25;
          timer.cancel();
        }
      });
     });
  }
  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 18.0, left: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BackButton(
                      color: Colors.blueAccent,
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
              const Padding(
                padding: EdgeInsets.only(top: 18.0),
                child: Text(
                'Tabata',
                style: TextStyle(fontSize: 80.0,
                color: Colors.blueAccent,
                ),
                  ),
                ),
                Expanded(
                  child: CircularPercentIndicator(
                    percent: percent,
                    animation: true,
                    animateFromLastPercent: true,
                    circularStrokeCap: CircularStrokeCap.round,
                    radius: 100.0,
                    lineWidth: 20.0,
                    progressColor: Colors.blueAccent,
                    center: Text(
                      '$TimeInMinut', 
                      style: const TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 55.0,
                      ),
                    ),
                    ) 
                ),
                const SizedBox(height: 30.0,),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0, bottom: 30.0),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                    
                                      const Text('Número de Round', style: TextStyle(fontSize: 20.0, color: Colors.white),),
                                    
                                      const SizedBox(height: 10.0,),
                                    
                                      TextField(

                                        decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "3 Rounds",
                                        hintStyle: TextStyle(fontSize: 55.0, color: Colors.white), 
                                        
                                        ),

                                      // keyboardType: TextInputType.number,
                                      // textAlign: TextAlign.center,
                                      // style: TextStyle(fontSize: 55.0, color: Colors.white),
                                      // inputFormatters: <TextInputFormatter>[
                                      // FilteringTextInputFormatter.digitsOnly]

                                      ),

                                      // const Text('4', style: TextStyle(fontSize: 55.0, color: Colors.white),)
                                    
                                    ]
                                ),
                                  )
                              ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                  
                                    const Text('Tempo de Pausa', style: TextStyle(fontSize: 20.0, color: Colors.white),),
                                  
                                    const SizedBox(height: 10.0,),
                                  
                                    const Text('30', style: TextStyle(fontSize: 55.0, color: Colors.white),)
                                  
                                  ]
                                )
                              )
                            ],
                          )
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 28.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.white,),
                            onPressed: (){
                              //  print(Timer);
                               _startTimer();
                             },
                            child: const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text('Começar!', style: TextStyle(color: Colors.blueAccent),),
                            ),
                          ), 
                        )
                      ],
                    ),
                  ),
                ) 
              )
            ],
          ),
        ),
      )
    );
  }
}