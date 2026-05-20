import 'package:flutter/material.dart';
import '../controllers/counter_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CounterController controller = CounterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Counter"), centerTitle: true),

      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          ),

          onPressed: () {
            setState(() {
              controller.increment();
            });
          },

          child: Text(
            controller.getCountText(),
            style: const TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }
}
