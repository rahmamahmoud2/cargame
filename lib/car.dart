import 'dart:async';

import 'package:flutter/material.dart';

class Car extends StatefulWidget {
  const Car({super.key});

  @override
  State<Car> createState() => _CarState();
}

class _CarState extends State<Car> {
  int questionIndex = 0;
  bool GameOver = false;

  List<Map<String, dynamic>> question = [
    {
      ' Question': 'what is the capital of france?',
      'Answer': ['Paris', 'Lyon', 'Marseille'],
      'correct answer': 'Paris'
    },
    {
      ' Question': 'what is the capital of italy?',
      'Answer': ['milan', 'Rome', 'Naples'],
      'correct answer': 'Rome'
    },
    {
      ' Question': 'what is the capital of germany?',
      'Answer': ['nurnberg', 'Munich', 'berlin'],
      'correct answer': 'Berlin'
    }
  ];

  double _topPosition = 0.0;
  double leftpos = 0.0;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_topPosition < 500) {
          _topPosition += 500 / 60;
        } else {
          timer.cancel();
        }
      });
    });
  }

  // void next(selectanswer) {
  //   if (selectanswer == question[questionIndex]['correct answer']) {
  //     setState(() {
  //       if (questionIndex < question.length - 1) {
  //         questionIndex++;
  //       } else {
  //         GameOver = true;
  //       }
  //     });
  //   } else {
  //     setState(() {
  //       GameOver = true;
  //     });
  //   }
  // }
  void containerontap() {
   String selectchosie;
    if (leftpos == 0.0) {
      selectchosie=question[questionIndex]['Answer'][0];
    }else if (leftpos == 100.0) {
      selectchosie=question[questionIndex]['Answer'][1];
    }else if (leftpos == 200.0) { 
      selectchosie=question[questionIndex]['Answer'][2];
    }else  
    {
      return;
    }
    if (selectchosie == question[questionIndex]['correct answer']) {
      setState(() {
        if (questionIndex < question.length - 1) {
          questionIndex++;
             _topPosition = 0.0;
        } else {GameOver = true;
        }
      });
      
    }
    }
      
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/image/down2.jpg'), fit: BoxFit.fill)),
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            Container(
              width: 300,
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                  child: Text(
                question[questionIndex][' Question'],
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(30)),
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: Duration(seconds: 1),
                      top: _topPosition,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: question[questionIndex]['Answer']
                              .map<Widget>((answer) {
                            return Container(
                              child: Container(
                                width: 150,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.transparent,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2.0,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    answer,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    // children: [
                    //   Container(
                    //     width: 150,
                    //     height: 50,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(20),
                    //       color: Colors.transparent,
                    //       border: Border.all(
                    //         color: Colors.white,
                    //         width: 2.0,
                    //       ),
                    //     ),
                    //     child: Center(
                    //       child: Text(
                    //     answer,
                    //         style: TextStyle(color: Colors.white),
                    //       ),
                    //     ),
                    //   ),
                    // Container(
                    //   width: 150,
                    //   height: 50,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(20),
                    //     color: Colors.transparent,
                    //     border: Border.all(
                    //       color: Colors.white,
                    //       width: 2.0,
                    //     ),
                    //   ),
                    //   child: Center(
                    //       child: Text(
                    //     'Lyon',
                    //     style: TextStyle(color: Colors.white),
                    //   )),
                    // ),
                    // Container(
                    //   width: 150,
                    //   height: 50,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(20),
                    //     color: Colors.transparent,
                    //     border: Border.all(
                    //       color: Colors.white,
                    //       width: 2.0,
                    //     ),
                    //   ),
                    //   child: Center(
                    //       child: Text(
                    //     'Marseille',
                    //     style: TextStyle(color: Colors.white),
                    //   )),
                    // )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Positioned(
                      left: 50,
                      bottom: 50,
                      child: InkWell(
                        onTap: () {
                         
                          leftpos = 0;
                          setState(() {});
                        },
                        child: Container(
                          width: 50,
                          height: 100,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 220,
                      bottom: 50,
                      child: InkWell(
                        onTap: () {

                      
                          leftpos = 170;
                          setState(() {});
                        },
                        child: Container(
                          width: 50,
                          height: 100,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 370,
                      bottom: 50,
                      child: InkWell(
                        onTap: () {
                          leftpos = 320;
                          setState(() {});
                        },
                        child: Container(
                          width: 50,
                          height: 100,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: Duration(seconds: 1),
                      bottom: 20,
                      left: leftpos,
                      child: Image.asset(
                        'assets/image/car.png',
                        width: 150,
                      ),
                    ),
                    Positioned(
                        left: 160,
                        bottom: 0,
                        top: 0,
                        child: VerticalDivider(
                          color: Colors.white,
                          thickness: 2,
                          width: 2,
                        )),
                    Positioned(
                        left: 320,
                        bottom: 0,
                        top: 0,
                        child: VerticalDivider(
                          color: Colors.white,
                          thickness: 2,
                          width: 2,
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
