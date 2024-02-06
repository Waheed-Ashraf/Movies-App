import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Core/Services/service_locator.dart';
import 'package:movies_app/Movies/presentation/Controllers/Now_Playing_cubit/now_playing_cubit.dart';
import 'package:movies_app/Movies/presentation/Views/movies_view.dart';

void main() {
  ServicesLocator().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NowPlayingCubit>(),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MoviesView(),
      ),
    );
  }
}
