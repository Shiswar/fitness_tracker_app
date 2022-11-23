import 'package:fitness_tracker_app/entities/workout.dart';
import 'package:isar/isar.dart';

part 'exercise.g.dart';

@Collection()
class Exercise {
  Id id = Isar.autoIncrement;
  late String name;
  late String type;

  @Backlink(to: "exercises")
  final workouts = IsarLink<Workout>();
}
