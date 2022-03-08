import 'package:bloc_test/bloc_test.dart';
import 'package:fit_buddy/workouts/data_source/workout_dao.dart';
import 'package:fit_buddy/workouts/page/controller/workout_view_model.dart';
import 'package:fit_buddy/workouts/page/controller/workouts_page_controller_cubit.dart';
import 'package:fit_buddy/workouts/service/workouts_bloc.dart';

import 'fake_workouts_data_source.dart';

void main() {
  final dataSource = FakeWorkoutsDataSource([
    WorkoutDao(1, 'title 1', DateTime(2043, 04, 22)),
    WorkoutDao(4, 'title 2', DateTime(2021, 11, 03)),
  ]);
  final workoutsBloc = WorkoutsBloc(dataSource);
  blocTest(
    'Get all workouts',
    build: () => WorkoutsPageController(workoutsBloc),
    act: (WorkoutsPageController controller) => controller.getAllWorkouts(),
    expect: () => [
      const WorkoutsPageState([
        WorkoutViewModel(1, 'title 1', '2043/04/22'),
        WorkoutViewModel(4, 'title 2', '2021/11/03'),
      ])
    ],
  );
}
