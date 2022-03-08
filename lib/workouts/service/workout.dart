import 'package:equatable/equatable.dart';

class Workout extends Equatable {
  final int id;
  final String title;
  final DateTime trainingAt;

  const Workout(this.id, this.title, this.trainingAt);

  @override
  List<Object?> get props => [id];
}
