import 'dart:io';

import '../models/config.dart';
import '../models/deck.dart';
import '../services/dealer.dart';

class Game {
  void play() {
    var done = false;
    var deck = Deck();
    deck.shuffle();
    var table = Config.instance.getTable(deck);
    table.audit();
    var dealer = Dealer();
    dealer.dealHands(table, deck);
    print('$table');
  }
/*
    deck.cards.forEach((card) {
      print('$card');
    });
  }
    while (!done) {
      stdout.writeln('N - new game');
      stdout.writeln('Q - quit');
      stdout.writeln('your choice: ');
      final input = stdin.readLineSync();
      stdout.writeln('You typed: $input');
    }
  }
  */
}
