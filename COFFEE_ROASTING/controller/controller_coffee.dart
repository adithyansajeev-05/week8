import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class RoastingController extends ChangeNotifier {
  // TIMER
  int currentSecond = 1;

  // MACHINE STATUS
  bool isRunning = false;

  // ANIMATION VALUES
  double drumRotation = 0;

  double smokeOffset = 0;

  double flameHeight = 40;

  // COFFEE COLOR
  Color beanColor = Colors.lightGreen;

  // TIMER
  Timer? timer;

  // START MACHINE
  void startMachine() {
    if (isRunning) return;

    isRunning = true;

    timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      // DRUM ROTATION
      drumRotation += 0.15;

      // SMOKE ANIMATION
      smokeOffset -= 1.5;

      if (smokeOffset < -25) {
        smokeOffset = 0;
      }

      // FLAME PULSE
      flameHeight = 40 + sin(timer.tick * 0.3) * 15;

      // EVERY SECOND
      if (timer.tick % 10 == 0) {
        currentSecond++;

        updateCoffeeColor();

        // STOP AT 50
        if (currentSecond >= 50) {
          currentSecond = 50;

          isRunning = false;

          timer.cancel();
        }
      }

      notifyListeners();
    });
  }

  // FORWARD BUTTON
  void forwardTime() {
    if (currentSecond < 50) {
      currentSecond++;

      updateCoffeeColor();

      notifyListeners();
    }
  }

  // BACKWARD BUTTON
  void backwardTime() {
    if (currentSecond > 1) {
      currentSecond--;

      updateCoffeeColor();

      notifyListeners();
    }
  }

  // RESET BUTTON
  void resetMachine() {
    timer?.cancel();

    currentSecond = 0;

    drumRotation = 0;

    smokeOffset = 0;

    flameHeight = 40;

    beanColor = Colors.lightGreen;

    isRunning = false;

    notifyListeners();
  }

  // COLOR LOGIC
  void updateCoffeeColor() {
    if (currentSecond >= 1 && currentSecond <= 10) {
      beanColor = Colors.lightGreen;
    } else if (currentSecond >= 20 && currentSecond <= 30) {
      beanColor = Colors.brown.shade300;
    } else if (currentSecond >= 30 && currentSecond <= 40) {
      beanColor = Colors.brown;
    } else if (currentSecond >= 40 && currentSecond <= 50) {
      beanColor = Colors.brown.shade900;
    }
  }
}
