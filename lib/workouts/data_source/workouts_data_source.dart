import 'package:supabase_flutter/supabase_flutter.dart';

import 'workout_dao.dart';

class WorkoutsDataSource {
  final _client = Supabase.instance.client;

  Future<List<WorkoutDao>> getAllWorkouts() async {
    final response = await _client.from('workouts').select().execute();
    return (response.data as List<dynamic>).map((e) => WorkoutDao(e["id"], e["title"], DateTime.parse(e["training_at"]))).toList();
  }
}
