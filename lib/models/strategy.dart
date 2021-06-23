import './card.dart';
import './hand.dart';
import './trick.dart';

abstract class Strategy {
  Card selectCard(Hand hand, Trick trick);
}

enum StrategyType {
  console,
  next_card,
}

class Strategies {
  Strategy buildStrategy(StrategyType strategyType) {
    var strategy;
    switch (strategyType) {
      case StrategyType.console:
        {
          strategy = _Console();
        }
        break;
      case StrategyType.next_card:
        {
          strategy = _NextCard();
        }
        break;
    }
    return strategy;
  }
}

class _NextCard extends Strategy {
  @override
  Card selectCard(Hand hand, Trick trick) {
    return hand.cards[0];
  }
}

class _Console extends Strategy {
  @override
  Card selectCard(Hand hand, Trick trick) {
    return _NextCard().selectCard(hand, trick);
  }
}
