import '../models/bid.dart';
import '../models/config.dart';
import '../models/deck.dart';
import '../models/hand.dart';
import '../models/table.dart';
import '../models/player.dart';
import '../models/trick.dart';
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
    final trick = Trick(table.trumpSuit);
    var bids = getBids(table, trick);
    table.tricks.add(trick);
    print('TODO: play round');
  }

  List<Bid> getBids(Table table, Trick trick) {
    var bids = <Bid>[];
    table.players.forEach((player) {
      var leadingSuit =
          (table.leadingCard.isUnknown) ? null : table.leadingSuit;
      trick.leadingSuit = leadingSuit;
      var bid = player.getBid(trick);
      if (table.leadingCard.isUnknown) {
        table.leadingCard = bid.card;
      }
      bids.add(bid);
      table.discard(bid.card);
    });
    return bids;
  }
}
