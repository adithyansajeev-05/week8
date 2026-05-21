import 'package:flutter/material.dart';
import '../controllers/counter_controller2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CounterController controller = CounterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter App")),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              controller.getCountText(),
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // MINUS BUTTON
                ElevatedButton(
                  onPressed: () {
                    controller.decrement();

                    setState(() {});
                  },

                  child: Text("-", style: TextStyle(fontSize: 25)),
                ),

                SizedBox(width: 20),

                // PLUS BUTTON
                ElevatedButton(
                  onPressed: () {
                    controller.increment();

                    setState(() {});
                  },

                  child: Text("+", style: TextStyle(fontSize: 25)),
                ),
              ],
            ),

            SizedBox(height: 30),

            // RESET BUTTON
            ElevatedButton(
              onPressed: () {
                controller.reset();

                setState(() {});
              },

              child: Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}
