import '../models/bid.dart';
import '../models/card.dart';
import '../models/cards.dart';

class RankInfo {
  final Ordinal ord;
  final suit;
  final rank;

  const RankInfo(this.ord, this.suit, this.rank);
}

abstract class _BaseMap {
  static const maxRankCeiling = 18;
  final Map<int, int> _map = {};

  void setCard(RankInfo info) {
    final id = Card(info.ord, info.suit).id;
    _map[id] = info.rank;
  }

  void setCards(List<RankInfo> infos) {
    infos.forEach((info) => setCard(info));
  }

  int getAt(int id) {
    return _map[id]!;
  }
}

class _OffsuitBlackMap extends _BaseMap {
  _OffsuitBlackMap() {
    // off-suit CLUBS
    const cards1 = [
      RankInfo(Ordinal.TEN, Suit.CLUBS, 1),
      RankInfo(Ordinal.NINE, Suit.CLUBS, 2),
      RankInfo(Ordinal.EIGHT, Suit.CLUBS, 3),
      RankInfo(Ordinal.SEVEN, Suit.CLUBS, 4),
      RankInfo(Ordinal.SIX, Suit.CLUBS, 5),
      RankInfo(Ordinal.FIVE, Suit.CLUBS, 6),
      RankInfo(Ordinal.FOUR, Suit.CLUBS, 7),
      RankInfo(Ordinal.THREE, Suit.CLUBS, 8),
      RankInfo(Ordinal.TWO, Suit.CLUBS, 9),
      RankInfo(Ordinal.ACE, Suit.CLUBS, 10),
      RankInfo(Ordinal.JACK, Suit.CLUBS, 11),
      RankInfo(Ordinal.QUEEN, Suit.CLUBS, 12),
      RankInfo(Ordinal.KING, Suit.CLUBS, 13),
    ];
    setCards(cards1);

    // off-suit SPADES
    const cards2 = [
      RankInfo(Ordinal.TEN, Suit.SPADES, 1),
      RankInfo(Ordinal.NINE, Suit.SPADES, 2),
      RankInfo(Ordinal.EIGHT, Suit.SPADES, 3),
      RankInfo(Ordinal.SEVEN, Suit.SPADES, 4),
      RankInfo(Ordinal.SIX, Suit.SPADES, 5),
      RankInfo(Ordinal.FIVE, Suit.SPADES, 6),
      RankInfo(Ordinal.FOUR, Suit.SPADES, 7),
      RankInfo(Ordinal.THREE, Suit.SPADES, 8),
      RankInfo(Ordinal.TWO, Suit.SPADES, 9),
      RankInfo(Ordinal.ACE, Suit.SPADES, 10),
      RankInfo(Ordinal.JACK, Suit.SPADES, 11),
      RankInfo(Ordinal.QUEEN, Suit.SPADES, 12),
      RankInfo(Ordinal.KING, Suit.SPADES, 13),
    ];
    setCards(cards2);
  }
} // _OffsuitBlackMap

class _OffsuitRedMap extends _BaseMap {
  _OffsuitRedMap() {
    // off-suit DIAMONDS
    const cards1 = [
      RankInfo(Ordinal.ACE, Suit.DIAMONDS, 1),
      RankInfo(Ordinal.TWO, Suit.DIAMONDS, 2),
      RankInfo(Ordinal.THREE, Suit.DIAMONDS, 3),
      RankInfo(Ordinal.FOUR, Suit.DIAMONDS, 4),
      RankInfo(Ordinal.FIVE, Suit.DIAMONDS, 5),
      RankInfo(Ordinal.SIX, Suit.DIAMONDS, 6),
      RankInfo(Ordinal.SEVEN, Suit.DIAMONDS, 7),
      RankInfo(Ordinal.EIGHT, Suit.DIAMONDS, 8),
      RankInfo(Ordinal.NINE, Suit.DIAMONDS, 9),
      RankInfo(Ordinal.TEN, Suit.DIAMONDS, 10),
      RankInfo(Ordinal.JACK, Suit.DIAMONDS, 11),
      RankInfo(Ordinal.QUEEN, Suit.DIAMONDS, 12),
      RankInfo(Ordinal.KING, Suit.DIAMONDS, 13),
    ];
    setCards(cards1);

    // off-suit HEARTS
    const cards2 = [
      RankInfo(Ordinal.TWO, Suit.HEARTS, 2),
      RankInfo(Ordinal.THREE, Suit.HEARTS, 3),
      RankInfo(Ordinal.FOUR, Suit.HEARTS, 4),
      RankInfo(Ordinal.FIVE, Suit.HEARTS, 5),
      RankInfo(Ordinal.SIX, Suit.HEARTS, 6),
      RankInfo(Ordinal.SEVEN, Suit.HEARTS, 7),
      RankInfo(Ordinal.EIGHT, Suit.HEARTS, 8),
      RankInfo(Ordinal.NINE, Suit.HEARTS, 9),
      RankInfo(Ordinal.TEN, Suit.HEARTS, 10),
      RankInfo(Ordinal.JACK, Suit.HEARTS, 11),
      RankInfo(Ordinal.QUEEN, Suit.HEARTS, 12),
      RankInfo(Ordinal.KING, Suit.HEARTS, 13),
    ];
    setCards(cards2);
  }
}

class _TrumpClubsMap extends _BaseMap {
  _TrumpClubsMap() {
    // trump CLUBS
    const suit = Suit.CLUBS;
    const cards = [
      RankInfo(Ordinal.TEN, suit, 1),
      RankInfo(Ordinal.NINE, suit, 2),
      RankInfo(Ordinal.EIGHT, suit, 3),
      RankInfo(Ordinal.SEVEN, suit, 4),
      RankInfo(Ordinal.SIX, suit, 5),
      // { 6 }
      RankInfo(Ordinal.FOUR, suit, 7),
      RankInfo(Ordinal.THREE, suit, 8),
      RankInfo(Ordinal.TWO, suit, 9),
      // { 10 }
      // { 11 }
      RankInfo(Ordinal.QUEEN, suit, 12),
      RankInfo(Ordinal.KING, suit, 13),
      RankInfo(Ordinal.ACE, suit, 14),
      RankInfo(Ordinal.ACE, Suit.HEARTS, 15),
      RankInfo(Ordinal.JACK, suit, 16),
      RankInfo(Ordinal.FIVE, suit, 17),
    ];
    setCards(cards);
  }
}

class _TrumpSpadesMap extends _BaseMap {
  _TrumpSpadesMap() {
    // trump SPADES
    const suit = Suit.SPADES;
    const cards = [
      RankInfo(Ordinal.TEN, suit, 1),
      RankInfo(Ordinal.NINE, suit, 2),
      RankInfo(Ordinal.EIGHT, suit, 3),
      RankInfo(Ordinal.SEVEN, suit, 4),
      RankInfo(Ordinal.SIX, suit, 5),
      // { 6 }
      RankInfo(Ordinal.FOUR, suit, 7),
      RankInfo(Ordinal.THREE, suit, 8),
      RankInfo(Ordinal.TWO, suit, 9),
      // { 10 }
      // { 11 }
      RankInfo(Ordinal.QUEEN, suit, 12),
      RankInfo(Ordinal.KING, suit, 13),
      RankInfo(Ordinal.ACE, suit, 14),
      RankInfo(Ordinal.ACE, Suit.HEARTS, 15),
      RankInfo(Ordinal.JACK, suit, 16),
      RankInfo(Ordinal.FIVE, suit, 17),
    ];

    setCards(cards);
  }
}

class _TrumpDiamondsMap extends _BaseMap {
  _TrumpDiamondsMap() {
    // trump DIAMONDS
    const suit = Suit.DIAMONDS;
    const cards = [
      RankInfo(Ordinal.TWO, suit, 2),
      RankInfo(Ordinal.THREE, suit, 3),
      RankInfo(Ordinal.FOUR, suit, 4),
      // { 5 }
      RankInfo(Ordinal.SIX, suit, 6),
      RankInfo(Ordinal.SEVEN, suit, 7),
      RankInfo(Ordinal.EIGHT, suit, 8),
      RankInfo(Ordinal.NINE, suit, 9),
      RankInfo(Ordinal.TEN, suit, 10),
      // { 11 }
      RankInfo(Ordinal.QUEEN, suit, 12),
      RankInfo(Ordinal.KING, suit, 13),
      RankInfo(Ordinal.ACE, suit, 14),
      RankInfo(Ordinal.ACE, Suit.HEARTS, 15),
      RankInfo(Ordinal.JACK, suit, 16),
      RankInfo(Ordinal.FIVE, suit, 17),
    ];

    setCards(cards);
  }
}

class _TrumpHeartsMap extends _BaseMap {
  _TrumpHeartsMap() {
    // trump HEARTS
    const suit = Suit.HEARTS;
    const cards = [
      RankInfo(Ordinal.TWO, suit, 2),
      RankInfo(Ordinal.THREE, suit, 3),
      RankInfo(Ordinal.FOUR, suit, 4),
      // { 5 }
      RankInfo(Ordinal.SIX, suit, 6),
      RankInfo(Ordinal.SEVEN, suit, 7),
      RankInfo(Ordinal.EIGHT, suit, 8),
      RankInfo(Ordinal.NINE, suit, 9),
      RankInfo(Ordinal.TEN, suit, 10),
      // { 11 }
      RankInfo(Ordinal.QUEEN, suit, 12),
      RankInfo(Ordinal.KING, suit, 13),
      // { 14 }
      RankInfo(Ordinal.ACE, suit, 15),
      RankInfo(Ordinal.JACK, suit, 16),
      RankInfo(Ordinal.FIVE, suit, 17),
    ];

    setCards(cards);
  }
}

class Ranker {
  static const unknownValue = -1;
  static const trumpSuitFactor = 1000;
  static const leadingSuitFactor = 100;
  var _trumpSuit = Suit.UNKNOWN;
  var _leadingSuit = Suit.UNKNOWN;

  final _offSuitBlack = _OffsuitBlackMap();
  final _offSuitRed = _OffsuitRedMap();

  final _trumpClubs = _TrumpClubsMap();
  final _trumpSpades = _TrumpSpadesMap();

  final _trumpDiamonds = _TrumpDiamondsMap();
  final _trumpHearts = _TrumpHeartsMap();

  Ranker(this._trumpSuit, this._leadingSuit);

  int compare(int a, int b) {
    return a == b
        ? 0
        : a > b
            ? 1
            : -1;
  }

  void customSortArray(List<Card> cards) {
    cards.sort((a, b) => customSort(a, b));
  }

  void customSortBids(List<Bid> bids) {
    bids.sort((a, b) => customSort(a.card, b.card));
  }

  int getValueFromId(Card card) {
    var value = unknownValue;
    final id = card.id;

    if (card.isTrump(_trumpSuit)) {
      if (card.suit == Suit.CLUBS || card.isAceOfHearts) {
        value = _trumpClubs.getAt(id);
      } else if (card.suit == Suit.SPADES || card.isAceOfHearts) {
        value = _trumpSpades.getAt(id);
      } else if (card.suit == Suit.DIAMONDS || card.isAceOfHearts) {
        value = _trumpDiamonds.getAt(id);
      } else if (card.suit == Suit.HEARTS) {
        value = _trumpHearts.getAt(id);
      }
    } else {
      if (card.isBlack) {
        value = _offSuitBlack.getAt(id);
      } else if (card.isRed) {
        value = _offSuitRed.getAt(id);
      }
    }

    return value;
  }

  int customSort(Card cardA, Card cardB) {
    var valueA = getValueFromId(cardA);
    var valueB = getValueFromId(cardB);

    if (valueA == unknownValue || valueB == unknownValue) {
      throw Exception('internal error ${cardA} ${cardB}');
    }

    final isCardATrump = cardA.isTrump(_trumpSuit);
    final isCardBTrump = cardB.isTrump(_trumpSuit);

    final isCardALeadingSuit = cardA.isLeadingSuit(_leadingSuit);
    final isCardBLeadingSuit = cardB.isLeadingSuit(_leadingSuit);

    if (isCardATrump) {
      valueA += trumpSuitFactor;
    }
    if (isCardBTrump) {
      valueB += trumpSuitFactor;
    }
    if (isCardALeadingSuit) {
      valueA += leadingSuitFactor;
    }
    if (isCardBLeadingSuit) {
      valueB += leadingSuitFactor;
    }

    final result = compare(valueA, valueB);

    return result;
  }
}
