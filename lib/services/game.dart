import 'dart:io';

class Game {
  void play() {
    var done = false;

    while (!done) {
      stdout.writeln('N - new game');
      stdout.writeln('Q - quit');
      stdout.writeln('your choice: ');
      final input = stdin.readLineSync();
      stdout.writeln('You typed: $input');
    }
  }
}
