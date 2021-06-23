import '../models/config.dart';
import '../models/deck.dart';
import '../models/table.dart';
import '../models/player.dart';
import '../utils/constants.dart';

class Dealer {
  Table newGame() {
    var table = Config.instance.getTable();
    return table;
  }

  void dealHands(Table table, Deck deck) {
    table.players.forEach((player) => dealHand(player, deck));
  }

  void dealHand(Player player, Deck deck) {
    for (var i = 0; i < Const.NUM_CARDS_IN_HAND; i++) {
      // var card = deck.nextCard();
      // player.dealCard(card);
    }
  }
}
