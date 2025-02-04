import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/coordinate.dart';
import '../bloc/main_screen_bloc.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => MainScreenBloc()..add(MainScreenInitialize()), child: const MainScreen());
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
    return BlocBuilder<MainScreenBloc, MainScreenState>(builder: (context, state) {
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
        body: GridView.count(
          crossAxisCount: sizeX,
          children: List.generate(sizeX * sizeY, (index) {
            final x = index % sizeX;
            final y = index ~/ sizeX;
            return GestureDetector(
              onTap: () => context.read<MainScreenBloc>().add(MainScreenTileKlicked(Coordinates(x: x, y: y))),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: state.tiles[Coordinates(x: x, y: y)] ?? false ? Colors.black : Colors.white,
                ),
              ),
            );
          }),
        ),
      );
    });
  }
}
