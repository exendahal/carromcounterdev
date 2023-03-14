// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import './ScoreUpdateScreen.dart';

class ScoreUpdateDialog extends StatelessWidget {
  int oldscore; // this thing should be final
  ScoreUpdateDialog(this.oldscore);
  int newscore = 0;

  gobacktoScreen(BuildContext context, newscore) {
    num finalscore = 0;
    finalscore = this.oldscore + newscore;
    Navigator.pop(context, finalscore);
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Enter Score'),
      children: <Widget>[
        SimpleDialogOption(
          child: TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Add Score'),
              autofocus: true,
              onChanged: (String value) {
                newscore = int.parse(value);
              }),
        ),
        SimpleDialogOption(
            child: Container(
          margin: const EdgeInsets.only(top: 20.0),
          child: TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue)),
            child: const Text(
              'Done',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => this.gobacktoScreen(context, this.newscore),
          ),
        )),
      ],
    );
  }
}
