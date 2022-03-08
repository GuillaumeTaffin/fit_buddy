import 'package:bloc_test/bloc_test.dart';
import 'package:fit_buddy/workouts/data_source/workout_dao.dart';
import 'package:fit_buddy/workouts/service/workout.dart';
import 'package:fit_buddy/workouts/service/workouts_bloc.dart';

import 'fake_workouts_data_source.dart';

void main() {
  final dataSource = FakeWorkoutsDataSource([
    WorkoutDao(0, 'title1', DateTime.now()),
    WorkoutDao(1, 'title2', DateTime.now()),
  ]);

  blocTest(
    'Get All workouts',
    build: () => WorkoutsBloc(dataSource),
    act: (WorkoutsBloc bloc) => bloc.add(GetAllWorkoutsEvent()),
    expect: () => [
      WorkoutsState([Workout(0, 'title1', DateTime.now()), Workout(1, 'title2', DateTime.now())])
    ],
  );
}
