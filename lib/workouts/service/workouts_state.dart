part of 'workouts_bloc.dart';

class WorkoutsState extends Equatable {
  final List<Workout> workouts;

  const WorkoutsState(this.workouts);

  @override
  List<Object> get props => [workouts];
}
