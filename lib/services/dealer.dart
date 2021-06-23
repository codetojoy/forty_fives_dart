import '../models/config.dart';
import '../models/table.dart';

class Dealer {
  Table newGame() {
    var table = Config.instance.getTable();
    return table;
  }
}
