import 'package:cat_api_task/ui/home/models/breeds.dart';
import 'package:flutter/material.dart';

class DropDownField extends StatefulWidget {
  const DropDownField(
      {Key? key,
      required this.label,
      required this.breedList,
      required this.onTap})
      : super(key: key);
  final String label;
  final List<Breed> breedList;
  final Function onTap;
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
                fontWeight: FontWeight.bold, color: Colors.orange.shade700),
          ),
        ),
        SizedBox(
          height: 60,
          child: DropdownButtonFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.orange),
                    borderRadius: BorderRadius.circular(20)),
                fillColor: Colors.white,
                filled: true),
            elevation: 10,
            isExpanded: true,
            value: widget.breedList[0],
            items: [
              ...widget.breedList
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.name!),
                      ))
                  .toList()
            ],
            onChanged: (item) {
              widget.onTap(item);
            },
          ),
        ),
      ],
    );
  }
}
