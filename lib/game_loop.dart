import 'dart:io';

import '../services/game.dart';

class GameLoop {
  void loop() {
    var done = false;

    while (!done) {
      stdout.writeln('N - new game');
      stdout.writeln('M - many games (for testing)');
      stdout.writeln('Q - quit');
      stdout.writeln('your choice: ');
      final input = stdin.readLineSync();
      stdout.writeln('You typed: $input');
      final upperInput = input!.toUpperCase();
      if (upperInput == 'N') {
        Game().play();
      } else if (upperInput == 'M') {
        final game = Game();
        final numGames = 200;
        for (var i = 0; i <= numGames; i++) {
          game.play();
        }
      } else if (upperInput == 'Q') {
        done = true;
      }
    }
    stdout.writeln('bye...');
  }
}
