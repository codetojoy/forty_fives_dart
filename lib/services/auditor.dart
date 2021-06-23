import '../models/table.dart';
import '../utils/constants.dart';
import '../utils/logger.dart';

class Auditor {
  bool audit(Table table) {
    final numCards = Const.NUM_CARDS_IN_DECK;
    final expected = (numCards * (numCards + 1)) / 2;
    var actual = 0;
    table.deck.cards.forEach((card) => actual += (card.id + 1));
    final result = (expected == actual);
    if (!result) {
      L.log('AUDIT ERROR e: $expected a: $actual');
    } else {
      L.log('audit ok');
    }
    return result;
  }
}
