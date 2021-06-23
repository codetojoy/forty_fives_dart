import './deck.dart';
import './player.dart';
import './card.dart';
import '../services/auditor.dart';

class Table {
  List<Player> players;
  Deck deck;
  Card? topCard;
  // int _roundNum = 0;

  Table(this.players, this.deck);

  void audit() {
    Auditor().audit(this);
  }

  @override
  String toString() {
    var result = '';
    if (topCard != null) {
      result += 'top: $topCard\n';
    }
    players.forEach((player) {
      result += '$player\n';
    });
    return result;
  }
}
