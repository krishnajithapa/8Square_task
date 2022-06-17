import 'dart:isolate';

void main() async {
  void printMessage(String message) async {
    Future.delayed(Duration(seconds: 2));
    print(message);
    for (int i = 0; i < 5; i++) {
      print('$i print');
    }
  }

//as dart is a single threaded language, we can implent concurrency in dart by using
// isolates which are similar to threads in multithreading
//but the main difference is that these isolates dont share same memory like threads
//and has its own memory heap.
//Isolates can be used to run multiple functions concurrently.
  await Isolate.spawn(
      printMessage, 'First Isolate printed at ${DateTime.now().second}');

  Isolate.spawn(
      printMessage, 'Third Isolate printed at ${DateTime.now().second}');
  print('First line after isolate funtion ${DateTime.now().second}');
  print('Second line after isolate funtion ${DateTime.now().second}');
  //this process also begin at the same time as the isolates above but gets printed after 10s delay on console
  Future.delayed(Duration(seconds: 10)).then(((value) {
    print('Third line after isolate funtion ${DateTime.now().second}');
  }));
  print('Krishna'.isValidName);
  print(DateTime.now().humanize);
  List<int> nums = [1, 2, 3];
  print(nums.krishnaFunction);
}

//extension methods
extension ExtendedString on String {
  bool get isValidName {
    return !this.contains(new RegExp(r'[0–9]'));
  }
}

extension on DateTime {
  String get humanize {
    // you have access to the instance in extension methods via 'this' keyword.
    return "${this.day}/${this.month}/${this.year}";
  }
}

extension Krishna on List {
  String get krishnaFunction {
    return "Krishna created this";
  }
}
