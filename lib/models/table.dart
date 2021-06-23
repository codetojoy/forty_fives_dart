import './deck.dart';
import './player.dart';
import './card.dart';
import '../services/auditor.dart';

class Table {
  List<Player> players;
  Deck deck;
  // Card _topCard = null;
  // int _roundNum = 0;

  Table(this.players, this.deck);

  void audit() {
    Auditor().audit(this);
  }

  @override
  String toString() {
    var result = '';
    players.forEach((player) {
      result += '$player\n';
    });
    return result;
  }
}
