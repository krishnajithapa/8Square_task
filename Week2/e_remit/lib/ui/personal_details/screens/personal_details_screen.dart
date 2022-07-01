import 'package:e_remit/ui/personal_details/models/user_data_model.dart';
import 'package:e_remit/ui/personal_details/providers/details_provider.dart';
import 'package:e_remit/ui/personal_details/widgets/custom_button.dart';
import 'package:e_remit/ui/personal_details/widgets/personal_detail_screen_body.dart';
import 'package:e_remit/utils/colors.dart';
import 'package:e_remit/utils/routes.dart' as route;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  int currentScreenStep = 0;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _idbController = TextEditingController();
  final TextEditingController _nationalityController = TextEditingController();
  final GlobalKey<FormState> _fKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            await removeFocus();
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        centerTitle: true,
        elevation: 0.7,
        shadowColor: Colors.red.shade400,
        title: const Text(
          "Personal Details",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
//to implement stepper widget
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Form(
          key: _fKey,
          child: getStepperBody(context),
        ),
      ),
    );
  }

  Future removeFocus() async {
    FocusScope.of(context).unfocus();
  }

  Stepper getStepperBody(BuildContext context) {
    return Stepper(
      type: StepperType.horizontal,
      steps: getSteps(),
      onStepTapped: (step) {
        setState(() {
          FocusScope.of(context).unfocus();
          currentScreenStep = step;
        });
      },
      currentStep: currentScreenStep,
      controlsBuilder: ((context, details) {
        return Container(
            margin: const EdgeInsets.only(top: 30),
            height: MediaQuery.of(context).size.height * 0.075,
            child: currentScreenStep == getSteps().length - 1
                ? CustomButton(label: 'Done', onNextPressed: () {})
                : CustomButton(
                    label: 'Next',
                    onNextPressed: () {
                      if (_fKey.currentState!.validate()) {
                        FocusScope.of(context).unfocus();
                        // final isLastStep =
                        //     currentScreenStep == getSteps().length - 1;
                        // setState(() {
                        //   if (!isLastStep) {
                        //     currentScreenStep = currentScreenStep + 1;
                        //   }
                        // });

                        Navigator.pushNamed(context, route.dataScreen,
                            arguments: {
                              "userDataModel": UserDataModel(
                                nationality: _nationalityController.text,
                                firstName: _firstNameController.text,
                                lastName: _lastNameController.text,
                                dob: _dobController.text,
                                gender:
                                    context.read<DetailsProvider>().userGender,
                                idNumber: _idbController.text,
                                residentalStatus: context
                                    .read<DetailsProvider>()
                                    .userResidentalStatus,
                              )
                            });
                      }
                    }));
      }),
      onStepContinue: () {
        final isLastStep = currentScreenStep == getSteps().length - 1;
        setState(() {
          if (!isLastStep) {
            currentScreenStep = currentScreenStep + 1;
          }
        });
      },
      onStepCancel: () {
        final isFirstStep = currentScreenStep == 0;
        setState(() {
          if (!isFirstStep) {
            currentScreenStep = currentScreenStep - 1;
          }
        });
      },
    );
  }

  ElevatedButton getNextButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_fKey.currentState!.validate()) {
          FocusScope.of(context).unfocus();
          final isLastStep = currentScreenStep == getSteps().length - 1;
          setState(() {
            if (!isLastStep) {
              currentScreenStep = currentScreenStep + 1;
            }
          });
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(buttonColor),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
      child: Text("Next".toUpperCase()),
    );
  }

  getSteps() => [
        firstStep(),
        dummyStep(1),
        dummyStep(2),
        dummyStep(3),
        dummyStep(4),
        dummyStep(5),
      ];

  Step firstStep() {
    return Step(
      state: currentScreenStep > 0 ? StepState.complete : StepState.indexed,
      isActive: currentScreenStep >= 0,
      title: Padding(
          padding: const EdgeInsets.only(
            bottom: 5,
          ),
          child: Text(
            '...',
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 16,
            ),
          )),
      content: PersonalDetailScreen1Body(
        firstNameController: _firstNameController,
        lastNameController: _lastNameController,
        dobController: _dobController,
        idController: _idbController,
        nationalityController: _nationalityController,
      ),
    );
  }

  Step dummyStep(number) {
    return Step(
        state:
            currentScreenStep > number ? StepState.complete : StepState.indexed,
        isActive: currentScreenStep >= number,
        title: number == 5
            ? const Text('')
            : Padding(
                padding: const EdgeInsets.only(
                  bottom: 5,
                ),
                child: Text(
                  '...',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 16,
                  ),
                ),
              ),
        content: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.6,
            child: Text('Dummy Screen $number')));
  }
}
