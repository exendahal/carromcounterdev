import 'package:flutter/material.dart';
import './ScoreUpdateDialog.dart';

class ScoreUpdateScreen extends StatefulWidget {
  final players;
  ScoreUpdateScreen({this.players});
  _ScoreUpdateScreenState createState() => _ScoreUpdateScreenState();
}

class _ScoreUpdateScreenState extends State<ScoreUpdateScreen> {
  List<int> scores = [0, 0, 0, 0];
  gotonewscreen(BuildContext context, index) async {
    var finalScore = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ScoreUpdateDialog(scores[index])),
    );
    setState(() {
      scores[index] = finalScore;
    });
  }

  returnMileStoneScore(int score) {
    if (score <= 83) {
      return (83 - score);
    } else {
      return (100 - score);
    }
  }

  Future<dynamic> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirmation Dialog'),
            content: const Text('Are you sure you want to reset the score?'),
            actions: <Widget>[
              TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey)),
                child: const Text('No'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue)),
                child: const Text('Yes'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Score Update"),
          ),
          body: GridView.builder(
              itemCount: widget.players.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          widget.players[index],
                          style: const TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 12.0),
                        alignment: Alignment.center,
                        child: Text(
                          scores[index].toString(),
                          style: const TextStyle(fontSize: 45.0),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 12.0),
                        child: TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue)),
                            child: const Text(
                              'Add Score',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                            onPressed: () => gotonewscreen(context, index)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 16),
                        alignment: Alignment.center,
                        child: Text(
                          returnMileStoneScore(scores[index]).toString(),
                          style: const TextStyle(fontSize: 30.0),
                        ),
                      ),
                    ],
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.9,
              )),
        ));
  }
}
