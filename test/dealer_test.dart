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
import 'package:forty_fives_dart/utils/constants.dart';

const CLUBS = Suit.CLUBS;
const DIAMONDS = Suit.DIAMONDS;
const HEARTS = Suit.HEARTS;
const SPADES = Suit.SPADES;
const UNKNOWN = Suit.UNKNOWN;
const tsUNKNOWN = TrickState.UNKNOWN;
const tsLEADING_NO_TRUMP = TrickState.LEADING_NO_TRUMP;
const tsTRUMP_PLAYED = TrickState.TRUMP_PLAYED;

// p1 leads best trump
final pc1a = [C.$AC, C.$2C, C.$3C, C.$4C, C.$6C];
final pc2a = [C.$7C, C.$2H, C.$3H, C.$4H, C.$5H];
final pc3a = [C.$9S, C.$2D, C.$3D, C.$4D, C.$5D];
final ta = C.$10C;

final valueMap = [
  // n, p1 cards, p2 cards, topCard
  {
    'n': 1,
    'pc1': pc1a,
    'pc2': pc2a,
    'pc3': pc3a,
    't': ta,
  },
];

void main() {
  // this is an absurd mega-test, but it seems to be working
  group('Dealer playRound', () {
    var players = <Player>[];
    var cards = <Card>[];
    late Player p1, p2, p3;

    void expectPlayerNumCards(List<Player> players, int numCards) {
      players.forEach((p) => expect(p.cards.length, numCards));
    }

    setUp(() {
      final nextStrategy = Strategies().buildStrategy(StrategyType.next_card);
      p1 = Player('Bach', Hand(), false, nextStrategy);
      p2 = Player('Chopin', Hand(), false, nextStrategy);
      p3 = Player('Mozart', Hand(), false, nextStrategy);
      players = [p1, p2, p3];
      cards = [];
    });
    valueMap.forEach((values) {
      test('$values.n', () {
        final pc1 = values['pc1'] as List<Card>;
        final pc2 = values['pc2'] as List<Card>;
        final pc3 = values['pc3'] as List<Card>;
        cards.addAll(pc1);
        cards.addAll(pc2);
        cards.addAll(pc3);
        // not shuffled
        final deck = Deck.provided(cards);
        final table = Table(players, deck);
        final dealer = Dealer();
        dealer.dealHands(table, deck);
        final topCard = values['t'] as Card;
        table.topCard = topCard;

        expectPlayerNumCards(players, 5);

        // test
        dealer.playRound(table);

        expect(table.tricks.length, 1);
        expect(table.tricks[0].bids.length, players.length);
        expect(table.tricks[0].winningBid!.player.name, p1.name);
        expect(table.tricks[0].winningBid!.player.points, Const.BASE_POINTS);
        expect(table.trumpSuit, Suit.CLUBS);
        expect(table.leadingSuit, Suit.CLUBS);
        expectPlayerNumCards(players, 4);
      });
    }); // valueMap
  }); // group
} // main
