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

// p1 leads winning trump
final pc1a = [C.$AC, C.$2C, C.$3C, C.$4C, C.$6C];
final pc2a = [C.$7C, C.$2H, C.$3H, C.$4H, C.$5H];
final pc3a = [C.$9S, C.$2D, C.$3D, C.$4D, C.$5D];
final ta = C.$10C;
final wa = 0;
final eta = CLUBS;
final ela = CLUBS;

// p1 leads non-trump, p2 low trump, p3 winning trump
final pc1b = [C.$AD, C.$2D, C.$3D, C.$4D, C.$6D];
final pc2b = [C.$7C, C.$2S, C.$3C, C.$4C, C.$5H];
final pc3b = [C.$AC, C.$2H, C.$3H, C.$4H, C.$8H];
final tb = C.$10C;
final wb = 2;
final etb = CLUBS;
final elb = DIAMONDS;

// p1 leads non-trump, p2 higher non-trump, p3 low non-trump
final pc1c = [C.$JD, C.$2D, C.$3D, C.$7D, C.$6D];
final pc2c = [C.$KD, C.$2S, C.$3S, C.$4S, C.$5S];
final pc3c = [C.$4D, C.$2H, C.$3H, C.$4H, C.$8H];
final tc = C.$10C;
final wc = 1;
final etc = CLUBS;
final elc = DIAMONDS;

var i = 1;
final valueMap = [
  // n, p1 cards, p2 cards, topCard, winner index, e-trump, e-leading
  {
    'n': i++,
    'pc1': pc1a,
    'pc2': pc2a,
    'pc3': pc3a,
    't': ta,
    'w': wa,
    'et': eta,
    'el': ela,
  },
  {
    'n': i++,
    'pc1': pc1b,
    'pc2': pc2b,
    'pc3': pc3b,
    't': tb,
    'w': wb,
    'et': etb,
    'el': elb,
  },
  {
    'n': i++,
    'pc1': pc1c,
    'pc2': pc2c,
    'pc3': pc3c,
    't': tc,
    'w': wc,
    'et': etc,
    'el': elc,
  },
];

void main() {
  // this is an absurd mega-test, but it seems to be working
  // it is more of an integration test
  group('Dealer playRound', () {
    var players = <Player>[];
    var cards = <Card>[];
    late Player p1, p2, p3;

    void expectPlayerNumCards(List<Player> players, int numCards) {
      players.forEach((p) => expect(p.cards.length, numCards));
    }

    void expectUniqueCards(List<Card> cards) {
      final numCards = cards.length;
      final numUnique = cards.toSet().length;
      expect(numUnique, numCards);
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
        expectUniqueCards(cards);
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

        final winnerIndex = values['w'] as int;
        final expectedWinner = players[winnerIndex];
        final actualWinner = table.tricks[0].winningBid!.player;
        expect(table.tricks.length, 1);
        expect(table.tricks[0].bids.length, players.length);
        expect(actualWinner.name, expectedWinner.name);
        expect(actualWinner.points, Const.BASE_POINTS);
        expectPlayerNumCards(players, 4);

        final expectedTrumpSuit = values['et'] as Suit;
        final expectedLeadingSuit = values['el'] as Suit;
        expect(table.trumpSuit, expectedTrumpSuit);
        expect(table.leadingSuit, expectedLeadingSuit);
      });
    }); // valueMap
  }); // group
} // main
