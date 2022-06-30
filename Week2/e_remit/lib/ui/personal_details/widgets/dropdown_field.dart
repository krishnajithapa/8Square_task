import 'package:flutter/material.dart';

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
            hint: const Text(
              "Choose Semester",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
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
            onChanged: (item) {},
          ),
        ),
      ],
    );
  }
}
