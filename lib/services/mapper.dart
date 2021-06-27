import '../models/card.dart';
import '../utils/constants.dart';

@deprecated
class Mapper {
  Ordinal mapOrdinal(var index) {
    // guard
    if (index < Const.SUIT_MIN_INDEX || index > Const.SUIT_MAX_INDEX) {
      throw Exception('illegal value for index: $index');
    }

    final result = Ordinal.values[index];

    return result;
  }

  Card mapInt(var n) {
    // guard
    if (n < Const.DECK_MIN_INDEX || n > Const.DECK_MAX_INDEX) {
      throw Exception('illegal value for n: $n');
    }

    final remainder = n % Const.NUM_CARDS_IN_SUIT;
    final ordinal = mapOrdinal(remainder);
    final index = (n / Const.NUM_CARDS_IN_SUIT).floor();
    final suit = Suit.values[index];

    final result = Card(ordinal, suit, n);

    return result;
  }
}
