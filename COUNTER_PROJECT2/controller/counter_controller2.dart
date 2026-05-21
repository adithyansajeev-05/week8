class CounterController {
  int count = 0;

  // ADD
  void increment() {
    count++;
  }

  // SUBTRACT
  void decrement() {
    count--;
  }

  // RESET
  void reset() {
    count = 0;
  }

  // DISPLAY TEXT
  String getCountText() {
    return "Count : $count";
  }
}
