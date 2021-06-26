import './bid.dart';
import './card.dart';
import './hand.dart';
import './trick.dart';
import '../utils/logger.dart';

abstract class Strategy {
  Card selectCard(Hand hand, Trick trick);

  void logInfo(Trick trick) {
    L.log('strategy $trick');
  }
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
    logInfo(trick);
    final result = hand.cards[0];
    L.log('next-card played: $result');
    return result;
  }
}

class _Console extends Strategy {
  @override
  Card selectCard(Hand hand, Trick trick) {
    return _NextCard().selectCard(hand, trick);
  }
}
