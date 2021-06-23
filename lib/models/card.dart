import '../utils/constants.dart';

enum Ordinal {
  ACE, //  = 0,
  TWO, //  = 1,
  THREE, //  = 2,
  FOUR, //  = 3,
  FIVE, //  = 4,
  SIX, //  = 5,
  SEVEN, //  = 6,
  EIGHT, //  = 7,
  NINE, //  = 8,
  TEN, //  = 9,
  JACK, //  = 10,
  QUEEN, //  = 11,
  KING, //  = 12,
}

enum Suit {
  CLUBS, //  = 0,
  DIAMONDS, //  = 1,
  HEARTS, //  = 2,
  SPADES, //  = 3,
}

class Card {
  int id = 0;
  Suit suit = Suit.SPADES;
  Ordinal ordinal = Ordinal.ACE;

  Card(Ordinal ordinal, Suit suit, [int id = 0]) {
    if (id == 0) {
      this.id = ordinal.index + suit.index * Const.NUM_CARDS_IN_SUIT;
    } else {
      this.id = id;
    }
    this.suit = suit;
    this.ordinal = ordinal;
  }

  String get imageURL {
    var ordStr = _buildOrdinalString();
    var suitStr = _buildSuitString();

    var result = 'assets/images/cards/${ordStr}${suitStr}.jpg';
    return result;
  }

  String _buildOrdinalString() {
    var result = '';
    var resultOrd = ordinal.index + 1;

    if (resultOrd < Const.SUIT_MIN_INDEX + 1 ||
        resultOrd > Const.SUIT_MAX_INDEX + 1) {
      // throw new TypeError("illegal value");
    }

    switch (resultOrd) {
      case 1:
        result = 'A';
        break;
      case 11:
        result = 'J';
        break;
      case 12:
        result = 'Q';
        break;
      case 13:
        result = 'K';
        break;
      default:
        result = '$resultOrd';
        break;
    }

    return result;
  }

  String _buildSuitString() {
    var result = '';

    switch (suit) {
      case Suit.CLUBS:
        result = 'C';
        break;
      case Suit.DIAMONDS:
        result = 'D';
        break;
      case Suit.HEARTS:
        result = 'H';
        break;
      case Suit.SPADES:
        result = 'S';
        break;
      default:
        result = 'ERROR';
        break;
    }

    return result;
  }

  @override
  String toString() {
    var ordStr = _buildOrdinalString();
    var suitStr = _buildSuitString();
    return '$ordStr$suitStr';
  }
}
