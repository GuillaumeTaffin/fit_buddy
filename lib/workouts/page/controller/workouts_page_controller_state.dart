part of 'workouts_page_controller_cubit.dart';

class WorkoutsPageState extends Equatable {
  final List<WorkoutViewModel> workouts;

  const WorkoutsPageState(this.workouts);

  @override
  List<Object> get props => [workouts];
}
