import 'package:fit_buddy/workouts/service/workout.dart';
import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  final Workout workout;

  const WorkoutCard(this.workout, {Key? key}) : super(key: key);

  String _formatDate(DateTime date) {
    return "${date.year}/${date.month}/${date.day}";
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      child: ListTile(
        title: Text(
          workout.title.toUpperCase(),
          style: textTheme.titleSmall,
        ),
        subtitle: Text(
          _formatDate(workout.trainingAt),
          style: textTheme.labelSmall?.copyWith(color: Theme.of(context).hintColor),
        ),
      ),
    );
  }
}
