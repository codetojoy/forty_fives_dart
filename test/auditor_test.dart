import 'package:forty_fives_dart/models/cards.dart';
import 'package:forty_fives_dart/models/deck.dart';
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
  }); // group
}
