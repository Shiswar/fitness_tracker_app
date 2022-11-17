import 'package:fitness_tracker_app/ui/workout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class ExerciseCard {
  ExerciseCard({
    required this.name,
    required this.picture,
  });

  String name;
  String picture;
}

List<Card> generateExercises(BuildContext context) {
  List<Card> cards = [];
  for (int i = 0; i < 6; i++) {
    Card card = Card(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 70,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    border: Border.all(width: 1, color: Colors.white30),
                    borderRadius: const BorderRadius.all(Radius.circular(2))
                    // You can use like this way or like the below line
                    //borderRadius: new BorderRadius.circular(30.0),
                    ),
                child: const Center(
                  child: Text(
                    'Picture',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.all(4),
                child: Text(
                  'Single Leg Romanian Dead Lift',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ))
            ],
          )),
    );
    cards.add(card);
  }
  return cards;
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TabBar(
                      controller: _tabController,
                      tabs: [
                        Tab(
                            child: Text(
                          'Exercises',
                          style: Theme.of(context).textTheme.headline2,
                        )),
                        Tab(
                            child: Text(
                          'Nutrition',
                          style: Theme.of(context).textTheme.headline2,
                        ))
                      ],
                    ),
                    Expanded(
                        child: TabBarView(
                      controller: _tabController,
                      children: [
                        ListView(children: generateExercises(context)),
                        const Text('Nutrition page')
                      ],
                    )),
                  ],
                ))));
  }
}
