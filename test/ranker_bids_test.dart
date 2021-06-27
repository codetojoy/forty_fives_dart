import 'package:test/test.dart';

import 'package:forty_fives_dart/models/bid.dart';
import 'package:forty_fives_dart/models/card.dart';
import 'package:forty_fives_dart/models/player.dart';
import 'package:forty_fives_dart/services/ranker.dart';

void main() {
  group('Ranker', () {
    Bid b(String name, Ordinal ord, Suit suit) {
      final card = Card(ord, suit);
      final player = Player.simple(name);
      final bid = Bid(card, player);
      return bid;
    }

    test('bids', () {
      final trumpSuit = Suit.CLUBS;
      final leadingSuit = Suit.DIAMONDS;
      final bids = [
        b('mozart', Ordinal.KING, Suit.SPADES),
        b('chopin', Ordinal.ACE, Suit.HEARTS),
        b('beethoven', Ordinal.FIVE, Suit.CLUBS),
        b('liszt', Ordinal.TWO, Suit.DIAMONDS),
      ];

      bids.shuffle();

      // test
      new Ranker(trumpSuit, leadingSuit).customSortBids(bids);

      var i = 0;
      expect(bids[i++].player.name, 'mozart');
      expect(bids[i++].player.name, 'liszt');
      expect(bids[i++].player.name, 'chopin');
      expect(bids[i++].player.name, 'beethoven');
    });
  }); // group
} // main
