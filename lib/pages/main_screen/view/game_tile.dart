import 'package:flutter/material.dart';

class GameTile extends StatelessWidget {
  const GameTile({
    super.key,
    required this.isAlive,
    this.onTap,
  });

  final VoidCallback? onTap;
  final bool isAlive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          //tiles could return null if tiles not yet initialized!
          color: isAlive ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}
