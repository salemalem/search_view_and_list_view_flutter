import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: SearchWidget(),
  )
);

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: TextField(
            decoration: InputDecoration(
              hintText: 'Music Search',
              contentPadding: EdgeInsets.only(left: 30.0),
            ),
            cursorColor: Colors.green,
            onSubmitted: (string) {
              debugPrint(string);
//              setState(() {});
            },
          ),
        ),
      );
  }
}
