import './player.dart';
import './card.dart';

class Table {
  List<Player> players;
  // Card _topCard = null;
  // int _roundNum = 0;

  Table(this.players);

  @override
  String toString() {
    var result = '';
    players.forEach((player) {
      result += '$player\n';
    });
    return result;
  }
}
