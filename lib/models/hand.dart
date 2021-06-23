import './card.dart';

class Hand {
  List<Card> _cards = [];

  Hand() {}

  Hand.provide(List<Card> cards) {
    _cards = cards;
  }

  get cards => _cards;

  void dealCard(Card card) {
    _cards.add(card);
  }

  @override
  String toString() {
    var result = '';
    _cards.forEach((card) {
      result += ' $card';
    });
    return result;
  }
}
