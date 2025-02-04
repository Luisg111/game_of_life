import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/coordinate.dart';
import '../bloc/main_screen_bloc.dart';
import 'game_tile.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => MainScreenBloc(), child: const MainScreen());
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenBloc, MainScreenState>(
      builder: (context, state) {
        return Scaffold(
          appBar: buildAppBar(state, context),
          body: buildBody(context, state),
        );
      },
    );
  }

  GridView buildBody(BuildContext context, MainScreenState state) {
    return GridView.count(
      crossAxisCount: sizeX,
      children: List.generate(sizeX * sizeY, (index) {
        final x = index % sizeX;
        final y = index ~/ sizeX;
        return GameTile(
          onTap: () => context.read<MainScreenBloc>().add(MainScreenTileKlicked(Coordinates(x: x, y: y))),
          isAlive: state.tiles[Coordinates(x: x, y: y)] ?? false,
        );
      }),
    );
  }

  AppBar buildAppBar(MainScreenState state, BuildContext context) {
    return AppBar(
      title: const Text('Conways Game Of Life'),
      actions: [
        Text("Step duration: ${state.stepDurationMs} ms"),
        Slider(
          min: 100,
          max: 2000,
          value: state.stepDurationMs.toDouble(),
          onChanged: (double value) {
                  context.read<MainScreenBloc>().add(MainScreenAutoplaySpeedChanged(value.toInt()));
                },
          label: "Autoplay Speed: ${state.stepDurationMs} ms",
        ),
        IconButton(
          icon: (state.isRunning) ? const Icon(Icons.pause) : const Icon(Icons.play_arrow),
          onPressed: () => context.read<MainScreenBloc>().add(MainScreenPlayPressed()),
          tooltip: (state.isRunning) ? 'Pause' : 'Play',
        ),
        IconButton(
          icon: const Icon(Icons.next_plan_outlined),
          onPressed: (state.isRunning) ? null : () => context.read<MainScreenBloc>().add(MainScreenAdvanceSingleStep()),
          tooltip: 'Advance Single Step',
        ),
        Text('Step: ${state.step}'),
        IconButton(
          icon: const Icon(Icons.replay),
          onPressed: () => context.read<MainScreenBloc>().add(MainScreenResetPressed()),
          tooltip: 'Reset',
        ),
      ],
    );
  }
}
