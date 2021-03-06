import 'package:fit_buddy/workouts/page/WorkoutCard.dart';
import 'package:fit_buddy/workouts/page/controller/workouts_page_controller_cubit.dart';
import 'package:fit_buddy/workouts/service/workouts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutsPage extends StatelessWidget {
  const WorkoutsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<WorkoutsBloc>().add(GetAllWorkoutsEvent());
    return BlocProvider.value(
      value: WorkoutsPageController(context.read<WorkoutsBloc>()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("WORKOUTS"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          child: BlocBuilder<WorkoutsPageController, WorkoutsPageState>(
            builder: (ctx, state) {
              if (state.workouts.isEmpty) {
                return const Center(child: Text('No workouts to display...'));
              } else {
                return ListView.builder(
                  itemBuilder: (c, i) => WorkoutCard(state.workouts[i]),
                  itemCount: state.workouts.length,
                );
              }
            },
          ),
        ),
        floatingActionButton: ElevatedButton.icon(
          icon: const Icon(Icons.add),
          label: const Text("NEW WORKOUT"),
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
      ),
    );
  }
}
