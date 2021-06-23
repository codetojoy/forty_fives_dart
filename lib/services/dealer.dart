import '../models/config.dart';
import '../models/deck.dart';
import '../models/hand.dart';
import '../models/table.dart';
import '../models/player.dart';
import '../utils/constants.dart';

class Dealer {
  void dealHands(Table table, Deck deck) {
    table.players.forEach((player) => dealHand(player, deck));
  }

  void dealHand(Player player, Deck deck) {
    final cards = deck.take(Const.NUM_CARDS_IN_HAND);
    final hand = Hand.provide(cards);
    player.dealHand(hand);
  }

  void playRound(Table table) {
    print('TODO: play round');
  }
}
