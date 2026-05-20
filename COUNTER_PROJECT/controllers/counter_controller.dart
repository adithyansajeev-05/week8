import '../models/counter_model.dart';

class CounterController {
  final CounterModel model = CounterModel();

  void increment() {
    model.count++;
  }

  String getCountText() {
    return "Count ${model.count}";
  }
}
