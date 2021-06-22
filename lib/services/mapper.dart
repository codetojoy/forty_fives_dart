import '../models/card.dart';
import '../util/constants.dart';

class Mapper {
  Ordinal mapOrdinal(var index) {
    // guard
    if (index < C.SUIT_MIN_INDEX || index > C.SUIT_MAX_INDEX) {
      throw Exception('illegal value for index: $index');
    }

    final result = Ordinal.values[index];

    return result;
  }

  Card mapInt(var n) {
    // guard
    if (n < C.DECK_MIN_INDEX || n > C.DECK_MAX_INDEX) {
      throw Exception('illegal value for n: $n');
    }

    final remainder = n % C.NUM_CARDS_IN_SUIT;
    final ordinal = mapOrdinal(remainder);
    final index = (n / C.NUM_CARDS_IN_SUIT).floor();
    final suit = Suit.values[index];

    final result = Card(ordinal, suit, n);

    return result;
  }
}
