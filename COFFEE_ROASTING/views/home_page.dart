import 'package:flutter/material.dart';
import '../controllers/controller_coffee.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final RoastingController controller = RoastingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,

        centerTitle: true,

        title: Text(
          "Coffee Roasting Machine",

          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),

      body: SingleChildScrollView(
        child: Center(
          child: ListenableBuilder(
            listenable: controller,

            builder: (context, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  SizedBox(height: 20),

                  // MACHINE BODY
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),

                    width: 320,
                    height: 500,

                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.grey.shade900, Colors.black],
                      ),

                      borderRadius: BorderRadius.circular(30),

                      border: Border.all(color: Colors.white, width: 4),

                      boxShadow: [BoxShadow(color: controller.beanColor)],
                    ),

                    child: Stack(
                      alignment: Alignment.center,

                      children: [
                        // TOP STATUS LIGHT
                        Positioned(
                          top: 20,

                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),

                            width: 25,
                            height: 25,

                            decoration: BoxDecoration(
                              shape: BoxShape.circle,

                              color: controller.isRunning
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                        ),

                        // SMOKE
                        Positioned(
                          top: 40 + controller.smokeOffset,

                          child: Opacity(
                            opacity: 0.5,

                            child: Icon(
                              Icons.cloud,

                              size: 70,

                              color: Colors.white,
                            ),
                          ),
                        ),

                        // ROASTING DRUM
                        Positioned(
                          top: 120,

                          child: Transform.rotate(
                            angle: controller.drumRotation,

                            child: Container(
                              width: 200,
                              height: 200,

                              decoration: BoxDecoration(
                                shape: BoxShape.circle,

                                gradient: LinearGradient(
                                  colors: [Colors.grey.shade800, Colors.black],
                                ),

                                border: Border.all(
                                  color: Colors.white,
                                  width: 4,
                                ),
                              ),

                              child: Center(
                                child: Wrap(
                                  spacing: 8,
                                  runSpacing: 8,

                                  children: List.generate(12, (index) {
                                    return AnimatedContainer(
                                      duration: Duration(milliseconds: 500),

                                      width: 25,
                                      height: 25,

                                      decoration: BoxDecoration(
                                        color: controller.beanColor,

                                        shape: BoxShape.circle,
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ),
                        ),

                        // FIRE FLAME
                        Positioned(
                          bottom: 40,

                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 100),

                            width: 80,

                            height: controller.flameHeight,

                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,

                                end: Alignment.bottomCenter,

                                colors: [
                                  Colors.yellow,
                                  Colors.orange,
                                  Colors.red,
                                ],
                              ),

                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30),

                  // TIMER TEXT
                  Text(
                    "Roasting Time : ${controller.currentSecond}s",

                    style: TextStyle(
                      color: Colors.white,

                      fontSize: 32,

                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 15),

                  // STAGE TEXT
                  Text(
                    controller.currentSecond <= 10
                        ? "Light Roast"
                        : controller.currentSecond <= 30
                        ? "Medium Roast"
                        : controller.currentSecond <= 40
                        ? "Brown Roast"
                        : "Dark Roast",

                    style: TextStyle(
                      color: controller.beanColor,

                      fontSize: 26,

                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 30),

                  // BUTTONS
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,

                    alignment: WrapAlignment.center,

                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown.shade600,
                        ),
                        onPressed: () {
                          controller.backwardTime();
                        },

                        child: Row(
                          mainAxisSize: MainAxisSize.min,

                          children: [
                            Icon(Icons.fast_rewind, color: Colors.black),

                            SizedBox(width: 8),

                            Text(
                              "Backward",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade600,
                        ),
                        onPressed: () {
                          controller.startMachine();
                        },

                        child: Row(
                          mainAxisSize: MainAxisSize.min,

                          children: [
                            Icon(Icons.play_arrow, color: Colors.black),

                            SizedBox(width: 8),

                            Text(
                              "Start Roasting",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown.shade600,
                        ),
                        onPressed: () {
                          controller.forwardTime();
                        },

                        child: Row(
                          mainAxisSize: MainAxisSize.min,

                          children: [
                            Icon(Icons.fast_forward, color: Colors.black),

                            SizedBox(width: 8),

                            Text(
                              "Forward",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),

                      ElevatedButton(
                        onPressed: () {
                          controller.resetMachine();
                        },

                        child: Row(
                          mainAxisSize: MainAxisSize.min,

                          children: [
                            Icon(Icons.refresh, color: Colors.black),

                            SizedBox(width: 8),

                            Text(
                              "Reset",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 40),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
