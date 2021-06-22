import '../util/constants.dart';
import '../services/mapper.dart';

class Deck {
  var cards;

  Deck() {
    var mapper = Mapper();
    var ids = List<int>.generate(C.DECK_MAX_INDEX, (i) => i);
    ids.forEach((id) {
      var card = mapper.mapInt(id);
      cards.add(card);
    });
  }
}
