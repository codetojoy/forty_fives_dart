import 'package:forty_fives_dart/dice.dart';

void main(List<String> arguments) {
  final dice = new DiceBuilder().build(DiceBuilder.RANDOM);
  final max = 20;
  final result = dice.roll(max);
 
  print('Hello world! result: $result');
}
