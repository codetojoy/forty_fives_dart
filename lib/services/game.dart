import 'dart:io';

import '../models/config.dart';
import '../models/deck.dart';
import '../models/table.dart';
import '../services/dealer.dart';
import '../services/dealer.dart';
import '../utils/constants.dart';

class Game {
  final _dealer = Dealer();

  Table setUp() {
    var deck = Deck();
    deck.shuffle();
    var table = Config.instance.getTable(deck);
    table.audit();
    _dealer.dealHands(table, deck);
    table.audit();
    final topCard = deck.take(1)[0];
    table.topCard = topCard;
    table.audit();
    return table;
  }

  void play() {
    var table = setUp();
    var roundCount = 1;
    while (roundCount <= Const.NUM_CARDS_IN_HAND) {
      _dealer.playRound(table);
      print('$table');
      roundCount++;
    }
  }
}
