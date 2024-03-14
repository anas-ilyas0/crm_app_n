import 'package:crm_new/ui/screens/new_lead/stepper/stepper.dart';
import 'package:flutter/material.dart';

class BusinessInfo extends StatefulWidget {
  const BusinessInfo({super.key});

  @override
  State<BusinessInfo> createState() => _BusinessInfoState();
}

class _BusinessInfoState extends State<BusinessInfo> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return MyStepper(
      steps: _getSteps(),
      currentStep: currentStep,
      onStepTapped: (step) {
        setState(() {
          currentStep = step;
        });
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
    );
  }

  List<Step> _getSteps() {
    return [
      Step(
        isActive: currentStep >= 0,
        state: currentStep <= 0 ? StepState.indexed : StepState.complete,
        title: const Text(''),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Text('Business Name*'),
            ),
            textFormField(),
            SizedBox(height: 20),
            SizedBox(
              child: Text('Business DBA*'),
            ),
            textFormField(),
            SizedBox(height: 20),
            SizedBox(
              child: Text('Company Group*'),
            ),
            textFormField(),
            SizedBox(height: 20),
            SizedBox(
              child: Text('Company Country*'),
            ),
            textFormField(),
            SizedBox(height: 20),
            SizedBox(
              child: Text('Tax ID'),
            ),
            textFormField(),
          ],
        ),
      ),
      Step(
        isActive: currentStep >= 1,
        state: currentStep <= 1 ? StepState.indexed : StepState.complete,
        title: const Text(''),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Text('Business Type'),
            ),
            textFormField(),
            SizedBox(height: 20),
            SizedBox(
              child: Text('Entity Type'),
            ),
            textFormField(),
            SizedBox(height: 20),
            SizedBox(
              child: Text('Business Date*'),
            ),
            textFormField(),
            SizedBox(height: 20),
            SizedBox(
              child: Text('Business Email*'),
            ),
            textFormField(),
            SizedBox(height: 20),
            SizedBox(
              child: Text('Business Phone'),
            ),
            textFormField(),
          ],
        ),
      ),
      Step(
        isActive: currentStep >= 2,
        state: currentStep <= 2 ? StepState.indexed : StepState.complete,
        title: const Text(''),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Text('Business URL*'),
            ),
            textFormField(),
            SizedBox(height: 20),
            SizedBox(
              child: Text('Business Address*'),
            ),
            textFormField(),
            SizedBox(height: 20),
            SizedBox(
              child: Text('Business City*'),
            ),
            textFormField(),
            SizedBox(height: 20),
            SizedBox(
              child: Text('Business State*'),
            ),
            textFormField(),
            SizedBox(height: 20),
            SizedBox(
              child: Text('Business Zip*'),
            ),
            textFormField(),
          ],
        ),
      ),
      Step(
        isActive: currentStep >= 3,
        state: currentStep <= 3 ? StepState.indexed : StepState.complete,
        title: const Text(''),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Text('Business Type'),
            ),
            textFormField(),
            SizedBox(height: 20),
            SizedBox(
              child: Text('Entity Type'),
            ),
            textFormField(),
            SizedBox(height: 20),
            SizedBox(
              child: Text('Business Date*'),
            ),
            textFormField(),
            SizedBox(height: 20),
            SizedBox(
              child: Text('Business Email*'),
            ),
            textFormField(),
            SizedBox(height: 20),
            SizedBox(
              child: Text('Business Phone'),
            ),
            textFormField(),
          ],
        ),
      ),
    ];
  }

  Widget textFormField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
