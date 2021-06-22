import './player.dart';
import './hand.dart';

class Config {
  List<Player> getPlayers() {
    var players = <Player>[];
    players.add(Player('User', Hand(), true));
    players.add(Player('Mozart', Hand(), false));
    players.add(Player('Chopin', Hand(), false));
    return players;
  }
}
