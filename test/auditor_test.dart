import 'package:forty_fives_dart/models/cards.dart';
import 'package:forty_fives_dart/models/config.dart';
import 'package:forty_fives_dart/models/deck.dart';
import 'package:forty_fives_dart/models/hand.dart';
import 'package:forty_fives_dart/models/table.dart';
import 'package:forty_fives_dart/services/auditor.dart';
import 'package:forty_fives_dart/utils/constants.dart';
import 'package:test/test.dart';

void main() {
  late var auditor;
  group('Auditor', () {
    setUp(() {
      auditor = Auditor();
    });
    test('audit basic table', () {
      final deck = Deck();
      deck.shuffle();
      final table = Table([], deck);

      // test
      var result = auditor.audit(table);

      expect(result, true);
    });
    test('audit with players', () {
      final deck = Deck();
      deck.shuffle();
      var players = Config.instance.getPlayers();
      final table = Table(players, deck);

      var card1 = deck.take(1)[0];
      players[0].dealHand(Hand().dealCard(card1));
      var card2 = deck.take(1)[0];
      players[1].dealHand(Hand().dealCard(card2));
      var card3 = deck.take(1)[0];
      players[2].dealHand(Hand().dealCard(card3));

      // test
      var result = auditor.audit(table);

      expect(result, true);
    });
  }); // group
}
