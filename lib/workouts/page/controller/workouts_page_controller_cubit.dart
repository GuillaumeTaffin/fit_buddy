import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fit_buddy/workouts/page/controller/workout_view_model.dart';
import 'package:fit_buddy/workouts/service/workouts_bloc.dart';

part 'workouts_page_controller_state.dart';

class WorkoutsPageController extends Cubit<WorkoutsPageState> {
  final WorkoutsBloc _workoutsBloc;

  WorkoutsPageController(this._workoutsBloc) : super(const WorkoutsPageState([])) {
    _workoutsBloc.stream.listen((state) => _onWorkoutsChange(state));
  }

  void getAllWorkouts() {
    _workoutsBloc.add(GetAllWorkoutsEvent());
  }

  _onWorkoutsChange(WorkoutsState state) {
    final workouts = state.workouts
        .map(
          (e) => WorkoutViewModel(e.id, e.title, _format(e.trainingAt)),
        )
        .toList();
    emit(WorkoutsPageState(workouts));
  }

  String _format(DateTime date) {
    final month = _prependZero(date.month);
    final day = _prependZero(date.day);
    return "${date.year}/$month/$day";
  }

  _prependZero(int value) => value < 10 ? "0$value" : value.toString();
}
