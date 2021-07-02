import '../models/bid.dart';
import '../models/deck.dart';
import '../models/hand.dart';
import '../models/table.dart';
import '../models/player.dart';
import '../models/trick.dart';
import '../utils/constants.dart';
import './filter.dart';
import './ranker.dart';

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
    final bids = getBids(table, trick);
    trick.bids = bids;
    final winningBid = determineRoundWinner(trick);
    awardPoints(winningBid);
    trick.winningBid = winningBid;
    print('ROUND WINNER: $winningBid');
    table.tricks.add(trick);
  }

  void awardPoints(Bid bid) {
    bid.player.points += Const.BASE_POINTS;
  }

  Bid determineRoundWinner(Trick trick) {
    final trumpSuit = trick.trumpSuit;
    final leadingSuit = trick.leadingSuit;
    final bids = trick.bids;
    Ranker(trumpSuit, leadingSuit).customSortBids(bids);
    return bids[bids.length - 1];
  }

  List<Bid> getBids(Table table, Trick trick) {
    final bids = <Bid>[];
    var firstPlayer = true;
    table.players.forEach((player) {
      if (firstPlayer) {
        trick.leadingSuit = table.leadingSuit;
        firstPlayer = false;
      }
      final bid = getBid(player, trick);
      if (table.leadingCard.isUnknown) {
        table.leadingCard = bid.card;
      }
      bids.add(bid);
      table.discard(bid.card);
    });
    return bids;
  }

  Bid getBid(Player player, Trick trick) {
    final filter = Filters().buildFilter(FilterType.proper);
    final cards = player.cards;
    final trumpSuit = trick.trumpSuit;
    final leadingSuit = trick.leadingSuit;
    final trumpPlayed = trick.hasTrumpBeenPlayed;
    final candidates =
        filter.getCandidates(cards, trumpSuit, leadingSuit, trumpPlayed);
    final bid = player.getBid(trick, candidates);
    if (bid.card.suit == trumpSuit) {
      trick.hasTrumpBeenPlayed = true;
    }
    return bid;
  }
}
