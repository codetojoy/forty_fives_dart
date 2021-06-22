import 'dart:io';

class GameLoop {
  void loop() {
    var done = false;

    while (!done) {
      stdout.writeln('N - new game');
      stdout.writeln('Q - quit');
      stdout.writeln('your choice: ');
      final input = stdin.readLineSync();
      stdout.writeln('You typed: $input');
      if (input!.toUpperCase() == "Q") {
        done = true;
      }
    }
    stdout.writeln('bye...');
  }
}
