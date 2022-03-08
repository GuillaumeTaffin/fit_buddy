import 'package:fit_buddy/workouts/page/controller/workout_view_model.dart';
import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  final WorkoutViewModel workout;

  const WorkoutCard(this.workout, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      child: ListTile(
        title: Text(
          workout.title.toUpperCase(),
          style: textTheme.titleSmall?.apply(fontWeightDelta: 2, letterSpacingDelta: 1),
        ),
        subtitle: Text(
          workout.formattedTrainingDate,
          style: textTheme.labelSmall?.copyWith(color: Theme.of(context).hintColor),
        ),
      ),
    );
  }
}
