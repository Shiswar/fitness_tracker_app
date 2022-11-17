import 'package:flutter/material.dart';

class Workout extends StatefulWidget {
  @override
  WorkoutState createState() {
    return WorkoutState();
  }
}

class WorkoutState extends State<Workout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ExpansionPanelList(
        children: [
          //workouts
          ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Card(
                  child: Column(
                    children: [
                      Text(
                        'Legs',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Power',
                        style: TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                );
              },
              body: Column(
                children: [
                  Text('leg exercise 1'),
                  Text('leg exercies 2'),
                ],
              ),
              isExpanded: true)

          //meals
        ],
      ),
    ));
  }
}
