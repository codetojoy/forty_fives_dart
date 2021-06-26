import './bid.dart';
import './card.dart';
import './hand.dart';
import './strategy.dart';
import './trick.dart';

class Player {
  String _name;
  Hand _hand;
  bool _interactive;
  Strategy _strategy;

  Player(this._name, this._hand, this._interactive, this._strategy);

  List<Card> get cards {
    return _hand.cards;
  }

  void dealHand(Hand hand) {
    _hand = hand;
  }

  bool handContainsCardOfSuit(Suit suit) {
    return _hand.containsCardOfSuit(suit);
  }

  Bid getBid(Trick trick) {
    final card = _strategy.selectCard(_hand, trick);
    final bid = Bid(card, this);
    _hand = _hand.removeCard(card);
    return bid;
  }

  @override
  String toString() {
    return '$_name $_hand';
  }
}
