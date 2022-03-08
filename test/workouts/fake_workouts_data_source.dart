import 'package:fit_buddy/workouts/data_source/workout_dao.dart';
import 'package:fit_buddy/workouts/data_source/workouts_data_source.dart';

class FakeWorkoutsDataSource implements WorkoutsDataSource {
  final List<WorkoutDao> workouts;

  FakeWorkoutsDataSource(this.workouts);

  @override
  Future<List<WorkoutDao>> getAllWorkouts() async {
    return workouts;
  }
}
