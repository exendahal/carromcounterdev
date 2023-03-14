import 'package:flutter/material.dart';
import './ScoreUpdateScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bajra CarromBoard Counter"),
      ),
      body: NewPlayerRegistration(),
    );
  }
}

List<String> playerslist = ["player1", "player2", "player3", "player4"];

class NewPlayerRegistration extends StatefulWidget {
  @override
  NewPlayerRegistrationForm createState() {
    return NewPlayerRegistrationForm();
  }
}

class NewPlayerRegistrationForm extends State<NewPlayerRegistration> {
  void gotonewscreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ScoreUpdateScreen(players: playerslist)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(10.0),
          child: TextField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(labelText: 'Player1'),
              autofocus: true,
              onChanged: (String value) {
                playerslist[0] = value;
              }),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: TextField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(labelText: 'Player2'),
              onChanged: (String value) {
                playerslist[1] = value;
              }),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: TextField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(labelText: 'Player3'),
              onChanged: (String value) {
                playerslist[2] = value;
              }),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: TextField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(labelText: 'Player4'),
              onChanged: (String value) {
                playerslist[3] = value;
              }),
        ),
        Container(
          margin: const EdgeInsets.all(30.0),
          child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue)),
              child: const Text(
                'Play',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => gotonewscreen()),
        )
      ],
    );
  }
}
