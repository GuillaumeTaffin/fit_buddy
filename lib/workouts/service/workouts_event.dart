part of 'workouts_bloc.dart';

abstract class WorkoutsEvent {
  const WorkoutsEvent();
}

class GetAllWorkoutsEvent extends WorkoutsEvent {}
