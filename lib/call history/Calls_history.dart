import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'History Page',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
    );
  }
}

