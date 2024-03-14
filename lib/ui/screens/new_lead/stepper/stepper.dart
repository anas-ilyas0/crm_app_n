import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class MyStepper extends StatelessWidget {
  final List<Step> steps;
  final int currentStep;
  final void Function(int) onStepTapped;
  final void Function() onStepContinue;
  final void Function() onStepCancel;

  MyStepper({
    required this.steps,
    this.currentStep = 0,
    required this.onStepTapped,
    required this.onStepContinue,
    required this.onStepCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        duration: const Duration(seconds: 2),
        transitionBuilder: (child, anim, sec) => SharedAxisTransition(
          transitionType: SharedAxisTransitionType.vertical,
          animation: anim,
          secondaryAnimation: sec,
          child: child,
        ),
        child: Stepper(
          key: ValueKey(currentStep),
          type: StepperType.horizontal,
          elevation: 0,
          connectorColor: const MaterialStatePropertyAll(Colors.indigo),
          steps: steps,
          currentStep: currentStep,
          onStepTapped: onStepTapped,
          onStepContinue: onStepContinue,
          onStepCancel: onStepCancel,
        ),
      ),
    );
  }
}
