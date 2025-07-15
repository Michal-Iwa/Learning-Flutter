import 'package:first_app/dice_roller.dart';
import 'package:flutter/material.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;
const colourConst1 = Color.fromARGB(255, 123, 135, 141);
const colourConst2 = Color.fromARGB(255, 199, 188, 229);

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.colour1, this.colour2, {super.key});

  const GradientContainer.grey({super.key})
    : colour1 = colourConst1,
      colour2 = colourConst2;

  final Color colour1;
  final Color colour2;  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: startAlignment,
          end: endAlignment,
          colors: [colour1, colour2],
        ),
      ),
      child: Center(
        child: DiceRoller()
      ),
    );
  }
}
