import 'package:equatable/equatable.dart';

class WorkoutViewModel extends Equatable {
  final int id;
  final String title;
  final String formattedTrainingDate;

  const WorkoutViewModel(this.id, this.title, this.formattedTrainingDate);

  @override
  List<Object?> get props => [id, title, formattedTrainingDate];
}
