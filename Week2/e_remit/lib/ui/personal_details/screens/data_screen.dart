import 'package:e_remit/ui/personal_details/models/user_data_model.dart';
import 'package:flutter/material.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({Key? key, required this.userDataModel}) : super(key: key);
  final UserDataModel userDataModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DataListTile(label: 'Nationality', data: userDataModel.nationality),
            DataListTile(label: 'First Name', data: userDataModel.firstName),
            DataListTile(label: 'Last Name', data: userDataModel.lastName),
            DataListTile(label: 'Id number', data: userDataModel.idNumber),
            DataListTile(label: 'Gender', data: userDataModel.gender),
            DataListTile(label: 'Date of birth', data: userDataModel.dob),
            DataListTile(
                label: 'Residental status',
                data: userDataModel.residentalStatus.toString()),
          ],
        ),
      ),
    );
  }
}

class DataListTile extends StatelessWidget {
  const DataListTile({Key? key, required this.data, required this.label})
      : super(key: key);
  final String label;
  final String data;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(label),
      title: Text(data),
    );
  }
}
