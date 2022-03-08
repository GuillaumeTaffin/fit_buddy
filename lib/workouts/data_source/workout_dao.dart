import 'package:equatable/equatable.dart';

class WorkoutDao extends Equatable {
  final int id;
  final String title;
  final DateTime trainingAt;

  const WorkoutDao(this.id, this.title, this.trainingAt);

  @override
  List<Object?> get props => [id];
}
