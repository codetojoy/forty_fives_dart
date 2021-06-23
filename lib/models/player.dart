import './card.dart';
import './hand.dart';

class Player {
  String _name;
  Hand _hand;
  bool _interactive;

  Player(this._name, this._hand, this._interactive);

  List<Card> get cards {
    return _hand.cards;
  }

  void dealHand(Hand hand) {
    _hand = hand;
  }

  @override
  String toString() {
    return '$_name $_hand';
  }
}
