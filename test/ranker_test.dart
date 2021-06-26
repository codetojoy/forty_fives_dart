import 'package:collection/collection.dart';
import 'package:test/test.dart';

import 'package:forty_fives_dart/models/card.dart';
import 'package:forty_fives_dart/models/cards.dart';
import 'package:forty_fives_dart/models/trick.dart';
import 'package:forty_fives_dart/services/ranker.dart';

/*
const CLUBS = Suit.CLUBS;
const DIAMONDS = Suit.DIAMONDS;
const HEARTS = Suit.HEARTS;
const SPADES = Suit.SPADES;
const UNKNOWN = Suit.UNKNOWN;
const tsUNKNOWN = TrickState.UNKNOWN;
const tsLEADING_NO_TRUMP = TrickState.LEADING_NO_TRUMP;
const tsTRUMP_PLAYED = TrickState.TRUMP_PLAYED;
*/

void main() {
  group('Ranker', () {
    test('customSort hearts', () {
      var trump = Suit.HEARTS;
      var cards = [
        Card(Ordinal.KING, trump),
        Card(Ordinal.QUEEN, trump),
        Card(Ordinal.JACK, trump),
        Card(Ordinal.TEN, trump),
        Card(Ordinal.NINE, trump),
        Card(Ordinal.EIGHT, trump),
        Card(Ordinal.SEVEN, trump),
        Card(Ordinal.SIX, trump),
        Card(Ordinal.FIVE, trump),
        Card(Ordinal.FOUR, trump),
        Card(Ordinal.THREE, trump),
        Card(Ordinal.TWO, trump),
        Card(Ordinal.ACE, trump),
      ];

      cards.shuffle();

      // test
      Ranker(trump, Suit.UNKNOWN).customSortArray(cards);

      var i = 0;
      expect(cards[i++].ordinal, Ordinal.TWO);
      expect(cards[i++].ordinal, Ordinal.THREE);
      expect(cards[i++].ordinal, Ordinal.FOUR);
      expect(cards[i++].ordinal, Ordinal.SIX);
      expect(cards[i++].ordinal, Ordinal.SEVEN);
      expect(cards[i++].ordinal, Ordinal.EIGHT);
      expect(cards[i++].ordinal, Ordinal.NINE);
      expect(cards[i++].ordinal, Ordinal.TEN);
      expect(cards[i++].ordinal, Ordinal.QUEEN);
      expect(cards[i++].ordinal, Ordinal.KING);
      expect(cards[i++].ordinal, Ordinal.ACE);
      expect(cards[i++].ordinal, Ordinal.JACK);
      expect(cards[i++].ordinal, Ordinal.FIVE);
    });
  }); // group
} // main
