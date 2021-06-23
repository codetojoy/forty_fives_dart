import './deck.dart';
import './player.dart';
import './hand.dart';
import './table.dart';

class Config {
  final _players = <Player>[];

  List<Player> getPlayers() {
    return _players;
  }

  Config._() {
    var p1 = Player('You', Hand(), true);
    var p2 = Player('Mozart', Hand(), false);
    var p3 = Player('Chopin', Hand(), false);
    _players.add(p1);
    _players.add(p2);
    _players.add(p3);
  }

  static Config instance = Config._();

  Table getTable(Deck deck) {
    var table = Table(_players, deck);
    return table;
  }
}
