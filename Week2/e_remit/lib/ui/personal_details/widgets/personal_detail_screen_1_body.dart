import 'package:e_remit/ui/personal_details/widgets/details_field.dart';
import 'package:e_remit/ui/personal_details/widgets/dropdown_field.dart';
import 'package:e_remit/ui/personal_details/widgets/search_field.dart';
import 'package:e_remit/utils/field_validator.dart';
import 'package:e_remit/utils/static_data.dart';
import 'package:flutter/material.dart';

class PersonalDetailScreen1Body extends StatefulWidget {
  const PersonalDetailScreen1Body({
    Key? key,
    required TextEditingController firstNameController,
    required TextEditingController lastNameController,
    required TextEditingController dobController,
    required TextEditingController idController,
  })  : _firstNameController = firstNameController,
        _lastNameController = lastNameController,
        _dobController = dobController,
        _idController = idController,
        super(key: key);

  final TextEditingController _firstNameController;
  final TextEditingController _lastNameController;
  final TextEditingController _dobController;
  final TextEditingController _idController;

  @override
  State<PersonalDetailScreen1Body> createState() =>
      _PersonalDetailScreen1BodyState();
}

class _PersonalDetailScreen1BodyState extends State<PersonalDetailScreen1Body> {
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SearchableField(
            validatorFunction: (value) {
              return Validator().validateNationality(value);
            },
          ),
          DetailsField(
            label: "First Name",
            hintText: 'Enter your first name',
            textEditingController: widget._firstNameController,
            validatorFunction: (value) {
              return Validator().validateFirstName(value);
            },
          ),
          DetailsField(
            label: "Last Name",
            hintText: 'Enter your last name',
            textEditingController: widget._lastNameController,
            validatorFunction: (value) {
              return Validator().validateLastName(value);
            },
          ),
          DetailsField(
            label: "ID Number",
            hintText: 'Enter your id number',
            textEditingController: widget._idController,
            needsFormatting: true,
            validatorFunction: (value) {
              return Validator().validateId(value);
            },
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      DropDownField(
                        label: 'Gender',
                        menuList: genderList,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: DateField(
                    hintText: 'Pick a Date',
                    label: "Date of Birth",
                    textEditingController: widget._dobController,
                    validatorFunction: (value) {
                      return Validator().validateDob(value);
                    },
                  ),
                )
              ],
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              "Residental Status",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.grey.shade700),
            ),
            trailing: Switch(
                value: switchValue,
                onChanged: (value) {
                  switchValue = !switchValue;
                  setState(() {});
                }),
          )
        ],
      ),
    );
  }
}
