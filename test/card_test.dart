import 'package:test/test.dart';
import 'package:forty_fives_dart/models/card.dart';
import 'package:forty_fives_dart/util/constants.dart';

void main() {
  final numCards = 3;

  group('Card', () {
    setUp(() {});
    test('canary', () {
      expect(4, 2 + 2);
    });
    test('imageURL basic', () {
      var card = Card(Ordinal.QUEEN, Suit.HEARTS);

      // test
      var result = card.imageURL;

      expect('assets/images/cards/QH.jpg', result);
    });
  });
}
