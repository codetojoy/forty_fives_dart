import './player.dart';
import './card.dart';

class Table {
  List<Player> _players;
  Card _topCard;
  int _roundNum = 0;

  Table(this._players, this._topCard);
}
