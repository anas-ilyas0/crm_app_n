import 'package:crm_new/ui/screens/new_lead/stepper/stepper.dart';
import 'package:flutter/material.dart';

class Price extends StatefulWidget {
  const Price({super.key});

  @override
  State<Price> createState() => _PriceState();
}

class _PriceState extends State<Price> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MyStepper(
            steps: _getSteps(),
            currentStep: currentStep,
            onStepTapped: (currentStep) {
              if (currentStep < _getSteps().length - 1) {
                currentStep + 1;
              }
            },
            onStepContinue: () {
              if (currentStep < _getSteps().length - 1) {
                setState(() {
                  currentStep += 1;
                });
              }
            },
            onStepCancel: () {
              if (currentStep > 0) {
                setState(() {
                  currentStep -= 1;
                });
              }
            },
          ),
        ],
      ),
    );
  }

  List<Step> _getSteps() {
    return [
      Step(
          isActive: currentStep >= 0,
          state: currentStep <= 0 ? StepState.indexed : StepState.complete,
          title: const Text(''),
          content: Column(
            children: [TextFormField()],
          )),
      Step(
          isActive: currentStep >= 1,
          state: currentStep <= 1 ? StepState.indexed : StepState.complete,
          title: const Text(''),
          content: Column(
            children: [],
          )),
      Step(
          isActive: currentStep >= 2,
          state: currentStep <= 2 ? StepState.indexed : StepState.complete,
          title: const Text(''),
          content: Column(
            children: [],
          )),
      Step(
          isActive: currentStep >= 3,
          state: currentStep <= 3 ? StepState.indexed : StepState.complete,
          title: const Text(''),
          content: Column(
            children: [],
          )),
      Step(
          isActive: currentStep >= 4,
          state: currentStep <= 4 ? StepState.indexed : StepState.complete,
          title: const Text(''),
          content: Column(
            children: [],
          )),
      //Add more steps as needed
    ];
  }
}
