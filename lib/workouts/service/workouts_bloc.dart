import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fit_buddy/workouts/data_source/workouts_data_source.dart';

import 'workout.dart';

part 'workouts_event.dart';

part 'workouts_state.dart';

class WorkoutsBloc extends Bloc<WorkoutsEvent, WorkoutsState> {
  final WorkoutsDataSource _dataSource;

  WorkoutsBloc(this._dataSource) : super(const WorkoutsState([])) {
    on<GetAllWorkoutsEvent>((event, emit) => _handleGetAllWorkouts(emit));
  }

  _handleGetAllWorkouts(Emitter<WorkoutsState> emit) async {
    final dao = await _dataSource.getAllWorkouts();
    final workouts = dao.map((e) => Workout(e.id, e.title, e.trainingAt)).toList();
    emit(WorkoutsState(workouts));
  }
}
