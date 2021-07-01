import 'package:test/test.dart';

import 'package:forty_fives_dart/models/card.dart';
import 'package:forty_fives_dart/models/cards.dart';
import 'package:forty_fives_dart/models/deck.dart';
import 'package:forty_fives_dart/models/table.dart';
import 'package:forty_fives_dart/models/trick.dart';
import 'package:forty_fives_dart/models/player.dart';
import 'package:forty_fives_dart/models/hand.dart';
import 'package:forty_fives_dart/models/strategy.dart';
import 'package:forty_fives_dart/services/dealer.dart';

const CLUBS = Suit.CLUBS;
const DIAMONDS = Suit.DIAMONDS;
const HEARTS = Suit.HEARTS;
const SPADES = Suit.SPADES;
const UNKNOWN = Suit.UNKNOWN;
const tsUNKNOWN = TrickState.UNKNOWN;
const tsLEADING_NO_TRUMP = TrickState.LEADING_NO_TRUMP;
const tsTRUMP_PLAYED = TrickState.TRUMP_PLAYED;

final pc1 = [C.$AC, C.$2C, C.$3C, C.$4C, C.$5C];
final pc2 = [C.$7C, C.$2H, C.$3H, C.$4H, C.$5H];

final valueMap = [
  // n, p1 cards, p2 cards, topCard
  {
    'n': 1,
    'pc1': pc1,
    'pc2': pc2,
    't': C.$10C,
  },
];

void main() {
  // this is an absurd mega-test, but it seems to be working
  group('Dealer playRound', () {
    valueMap.forEach((values) {
      test('$values.n', () {
        // not shuffled
        final pc1 = values['pc1'] as List<Card>;
        final pc2 = values['pc2'] as List<Card>;
        final cards = <Card>[];
        cards.addAll(pc1);
        cards.addAll(pc2);
        final deck = Deck.provided(cards);
        final nextStrategy = Strategies().buildStrategy(StrategyType.next_card);
        final p1 = Player('Bach', Hand(), false, nextStrategy);
        final p2 = Player('Mozart', Hand(), false, nextStrategy);
        final players = [p1, p2];
        final table = Table(players, deck);
        final dealer = Dealer();
        dealer.dealHands(table, deck);
        final topCard = values['t'] as Card;
        table.topCard = topCard;

        expect(p1.cards.length, 5);
        expect(p2.cards.length, 5);

        // test
        dealer.playRound(table);

        expect(table.tricks.length, 1);
        expect(table.tricks[0].bids.length, 2);
        expect(table.tricks[0].winningBid!.player.name, p1.name);
        expect(table.trumpSuit, Suit.CLUBS);
        expect(table.leadingSuit, Suit.CLUBS);
        expect(p1.cards.length, 4);
        expect(p2.cards.length, 4);
      });
    }); // valueMap
  }); // group
} // main
