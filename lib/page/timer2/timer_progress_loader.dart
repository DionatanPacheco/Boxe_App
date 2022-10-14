import 'package:flutter/material.dart';

class TimerProgressLoader extends StatefulWidget {
  @override
  _TimerProgressLoaderState createState() => _TimerProgressLoaderState();
}

  class _TimerProgressLoaderState extends State<TimerProgressLoader> 
        with SingleTickerProviderStateMixin{
    
    //animation circle
    late Animation<double> _animation;
    late AnimationController _animationController;

    //values animation
    double _animationValue = 0;
    double _beginValue = 0;
    double _endValue = 1;

    //dimension circle
    final double _loaderSize = 200;

    //not private, so we can acess it
    void _animateToProgress({required double beginValue, required double endValue}) {
      _beginValue = beginValue;
      _endValue = endValue;

      _animationController.reset();
      _animationController.forward();
    }

    @override
    void initState() {
      super.initState();

      //initialize animation controller
      _animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 60),
      );

      //dfine animation
      _assignAnimation();


      //start animation, when page loads
      _animationController.forward();
    }

    void _assignAnimation() {
      _animation = Tween<double>(begin: _beginValue, end: _endValue)
      .animate(_animationController)
      
          //add listeners if required
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {});
    }

    @override
    Widget build(BuildContext context){
      //update animation value when page state update
      _animationValue = _animation.value;

      //loading wrapper
      return SizedBox(
        width: _loaderSize,
        height: _loaderSize,
        // decoration: const BoxDecoration(
        // color: Colors.blueGrey,
        // shape: BoxShape.circle,
        // ),

        //stack contains the background and foreground circle to
        //cover the front
        child: Stack(
          children: [

            //main gradient, that will animate
            ShaderMask(
              shaderCallback: (rect) {
                return SweepGradient(
                  stops: [_animationValue, _animationValue],
                  center: Alignment.center,
                  colors: [
                Colors.white.withAlpha(90),
                Colors.white,
                  ],
                ).createShader(rect);
              },
              child: Container(
                width: _loaderSize,
                height: _loaderSize,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Container(),
              ),
            ),

            //cover to block the center part of gradiente loading circle
            Center(
              child: Container(
                width: _loaderSize - 10,
                height: _loaderSize - 10,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.withOpacity(0.99),
                  shape: BoxShape.circle,
                ),
              ),
            )
          ],
        ),
      ); 
    }
  } 