import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './timer_bloc.dart';

class Timer extends StatefulWidget {
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  final _bloc = TimerBloc();

  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: BlocBuilder(
            bloc: _bloc,
            builder: (context, int snapshot) {
              return Container(
                //color: _bloc.active() ? Colors.black87 : Colors.black,
                color: Colors.black,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "${(snapshot / 1000).floor()}",
                            style:
                                TextStyle(fontSize: 100, color: Colors.white),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            "${snapshot % 1000}",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Center(
                              child: AnimatedOpacity(
                                opacity: _bloc.active() ? 1.0 : 0.0,
                                duration: Duration(milliseconds: 100),
                                child: Container(
                                  width: 85,
                                  height: 85,
                                  child: FloatingActionButton(
                                    onPressed: () {
                                      _bloc.reset();
                                    },
                                    shape: CircleBorder(side: BorderSide(width: 2, color: Colors.white)),
                                    child: Icon(Icons.restore,size: 35,),
                                    backgroundColor: Colors.black,
                                    tooltip: "Reset",
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 0,
                          ),
                          Container(
                            child: Center(
                              child: AnimatedOpacity(
                                opacity: _bloc.active() ? 0.0 : 1.0,
                                duration: Duration(milliseconds: 100),
                                child: FloatingActionButton(
                                  onPressed: () {
                                    _bloc.start();
                                  },
                                  shape: CircleBorder(
                                      side: BorderSide(
                                          width: 2, color: Colors.white)),
                                  child: Icon(
                                    Icons.play_arrow,
                                    size: 35,
                                    color: Colors.black,
                                  ),
                                  backgroundColor: Colors.greenAccent[700],
                                  tooltip: "Start",
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 0,
                          ),
                          Container(
                            child: Center(
                              child: AnimatedOpacity(
                                opacity: _bloc.active() ? 1.0 : 0.0,
                                duration: Duration(milliseconds: 100),
                                child: Container(
                                  width: 85,
                                  height: 85,
                                  child: FloatingActionButton(
                                    onPressed: () {
                                      _bloc.pause();
                                    },
                                    shape: CircleBorder(side: BorderSide(width: 2, color: Colors.white)),
                                    child: Icon(Icons.pause,size: 35,),
                                    backgroundColor: Colors.black,
                                    tooltip: "Pause",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 80,
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
