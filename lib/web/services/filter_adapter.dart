import 'package:forty_fives_dart/models/card.dart';
import 'package:forty_fives_dart/services/filter.dart';
import 'package:forty_fives_dart/services/ranker.dart';
import './parser.dart';
import '../utils.dart';

// No HTTP dependencies here... just business logic

class FilterAdapter {
  final _parser = Parser();
  final _filter = Filters().buildFilter(FilterType.proper);

  // returns JSON: { 'cards': 'AH,2C,3D,5S' }
  String getCandidates(String trumpStr, String leadingStr,
      String trumpPlayedStr, String cardsStr) {
    final trump = _parser.parseSuit(trumpStr);
    if (trump == Suit.UNKNOWN) {
      throw Exception("unknown trump suit");
    }
    final leading = _parser.parseSuit(leadingStr);
    final cards = _parser.parseCards(cardsStr);
    final trumpPlayed = trumpPlayedStr.toLowerCase() == 'true';
    final candidates =
        _filter.getCandidates(cards, trump, leading, trumpPlayed);
    // sort the candidates so that BDD verification is deterministic
    // (i.e. if we do initial shuffle)
    final ranker = Ranker(trump, leading);
    ranker.customSortArray(candidates);
    final result = _buildCardsString(candidates.reversed.toList());
    return result;
  }

  String _buildCardsString(List<Card> cards) {
    var cardsStr = '';
    cards.forEach((card) => cardsStr += '$card,');
    cardsStr = cardsStr.substring(0, cardsStr.length - 1);
    return myJsonEncode('cards', cardsStr);
  }
}
