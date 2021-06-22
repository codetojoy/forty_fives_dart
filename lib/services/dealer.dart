import '../models/config.dart';
import '../models/table.dart';

class Dealer {
  Table newGame() {
    var players = Config().getPlayers();
    var table = Table(players);
    return table;
  }
}
