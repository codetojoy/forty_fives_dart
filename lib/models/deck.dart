import '../utils/constants.dart';
import '../services/mapper.dart';
import './card.dart';

class Deck {
  var cards = <Card>[];

  Deck() {
    var mapper = Mapper();
    var ids = List<int>.generate(Const.DECK_MAX_INDEX, (i) => i);
    ids.forEach((id) {
      var card = mapper.mapInt(id);
      cards.add(card);
    });
  }

  void shuffle() {
    cards.shuffle();
  }

  List<Card> take(int n) {
    var result = cards.take(n).toList();
    return result;
  }
}
