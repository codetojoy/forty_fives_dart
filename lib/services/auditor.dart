import '../models/table.dart';
import '../models/card.dart';
import '../utils/constants.dart';
import '../utils/logger.dart';

class Auditor {
  int _sum(List<Card> cards) {
    var result = 0;
    cards.forEach((card) => result += (card.id + 1));
    return result;
  }

  bool audit(Table table) {
    final numCards = Const.NUM_CARDS_IN_DECK;
    final expected = (numCards * (numCards + 1)) / 2;
    var actual = 0;
    actual += _sum(table.deck.cards);
    table.players.forEach((player) => actual += _sum(player.cards));
    final result = (expected == actual);
    if (!result) {
      L.log('AUDIT ERROR e: $expected a: $actual');
    } else {
      L.log('audit ok');
    }
    return result;
  }
}
