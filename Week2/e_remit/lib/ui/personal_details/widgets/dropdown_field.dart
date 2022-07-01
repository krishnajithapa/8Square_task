import 'dart:developer';

import 'package:e_remit/ui/personal_details/providers/details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropDownField extends StatefulWidget {
  const DropDownField({Key? key, required this.label, required this.menuList})
      : super(key: key);
  final String label;
  final List<String> menuList;
  @override
  State<DropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            widget.label,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey.shade700),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.076,
          child: DropdownButtonFormField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                fillColor: Colors.white,
                filled: true),
            elevation: 10,
            isExpanded: true,
            value: widget.menuList[0],
            items: [
              ...widget.menuList
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList()
            ],
            onChanged: (item) {
              context.read<DetailsProvider>().setUserGender(item.toString());
              log(item.toString());
            },
          ),
        ),
      ],
    );
  }
}
