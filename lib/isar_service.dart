import 'dart:async';
import 'dart:core';
import 'package:fitness_tracker_app/entities/exercise.dart';
import 'package:fitness_tracker_app/entities/workout.dart';
import 'package:isar/isar.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<void> saveExercise(Exercise newExercise) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.exercises.putSync(newExercise));
  }

  Future<void> saveWorkout(Workout newWorkout) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.workouts.putSync(newWorkout));
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([ExerciseSchema, WorkoutSchema], inspector: true);
    }
    return Future.value(Isar.getInstance());
  }

  Future<List<Exercise>> getAllExercises() async {
    final isar = await db;
    return await isar.exercises.where().findAll();
  }

  Future<Workout?> getWorkoutById(int id) async {
    final isar = await db;
    final workout = await isar.workouts.filter().idEqualTo(id).findFirst();
    return workout;
  }

  Stream<List<Exercise>> listenToExercises() async* {
    final isar = await db;
    yield* isar.exercises.where().watch(fireImmediately: true);
  }
}
