import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/main_screen_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainScreenBloc(),
      child: BlocBuilder<MainScreenBloc, MainScreenState>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Conways Game Of Life'),
            actions: [
              IconButton(
                icon: (state.isRunning) ? const Icon(Icons.pause) : const Icon(Icons.play_arrow),
                onPressed: () => context.read<MainScreenBloc>().add(MainScreenPlayPressed()),
                tooltip: (state.isRunning) ? 'Pause' : 'Play',
              ),
              IconButton(
                icon: const Icon(Icons.next_plan_outlined),
                onPressed: () => context.read<MainScreenBloc>().add(MainScreenAdvanceSingleStep()),
                tooltip: 'Advance Single Step',
              ),
              IconButton(
                icon: const Icon(Icons.replay),
                onPressed: () => context.read<MainScreenBloc>().add(MainScreenResetPressed()),
                tooltip: 'Reset',
              ),
              Text('Step: ${state.step}'),
            ],
          ),
          body: const Placeholder(),
        );
      }),
    );
  }
}
