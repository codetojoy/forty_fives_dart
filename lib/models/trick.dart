import './card.dart';
import './bid.dart';

enum TrickState {
  UNKNOWN, // = 0,
  NEW, // = 1,
  LEADING_NO_TRUMP, // = 2,
  TRUMP_PLAYED, // = 3,
}

class Trick {
  Suit trumpSuit;
  Suit? leadingSuit;
  // bool _hasTrumpBeenPlayed;
  // Bid _winningBid;
  // int _pointValue;
  List<Bid> bids = [];

  Trick(this.trumpSuit);

  @override
  String toString() {
    final leadingSuitStr = (leadingSuit == null) ? 'N/A' : leadingSuit.toString();
    return 'trump: $trumpSuit leading: $leadingSuitStr # bids: ${bids.length}';
  }
}
