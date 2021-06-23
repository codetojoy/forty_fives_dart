import './player.dart';
import './card.dart';

class Table {
  List<Player> _players;
  // Card _topCard = null;
  // int _roundNum = 0;

  Table(this._players);

  @override
  String toString() {
    var result = '';
    _players.forEach((player) {
      result += '$player\n';
    });
    return result;
  }
}
