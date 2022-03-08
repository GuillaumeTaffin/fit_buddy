import 'package:fit_buddy/auth/bloc/auth_bloc.dart';
import 'package:fit_buddy/auth/page/auth_page.dart';
import 'package:fit_buddy/workouts/data_source/workouts_data_source.dart';
import 'package:fit_buddy/workouts/page/workouts_page.dart';
import 'package:fit_buddy/workouts/service/workouts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'auth/bloc/auth_state.dart';
import 'auth/data_source/auth_data_source.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://dgkfawvhhnebudaxalqd.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRna2Zhd3ZoaG5lYnVkYXhhbHFkIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NDUwMTUxNDcsImV4cCI6MTk2MDU5MTE0N30.wdbgbIuRZBdgd2H1FJOU0V5hblKc3vE1LKI8H33JWmQ',
  );
  runApp(MultiBlocProvider(providers: [
    BlocProvider<AuthBloc>(
      create: (BuildContext context) => AuthBloc(dataSource: AuthDataSource()),
    ),
    BlocProvider<WorkoutsBloc>(
      create: (BuildContext context) => WorkoutsBloc(WorkoutsDataSource()),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.indigo,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepOrange[900],
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.deepOrange[900],
          brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.robotoTextTheme().apply(bodyColor: Colors.white),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepOrange[900],
          titleTextStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
      home: BlocBuilder<AuthBloc, AuthState>(builder: (ctx, state) {
        if (state.authenticated) {
          return const WorkoutsPage();
        } else {
          return const AuthPage();
        }
      }),
    );
  }
}
