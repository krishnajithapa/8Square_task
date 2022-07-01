import 'package:e_remit/ui/personal_details/widgets/code_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailsField extends StatelessWidget {
  const DetailsField(
      {Key? key,
      required this.hintText,
      required this.label,
      required this.textEditingController,
      this.needsFormatting,
      required this.validatorFunction,
      this.hasSuffix})
      : super(key: key);
  final String label;
  final String hintText;
  final bool? needsFormatting;
  final TextEditingController textEditingController;
  final Function(String?) validatorFunction;
  final bool? hasSuffix;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            label,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey.shade700),
          ),
        ),
        TextFormField(
          controller: textEditingController,
          readOnly: hasSuffix != null ? true : false,
          inputFormatters: needsFormatting != null && needsFormatting == true
              ? [CardFormatter(sample: 'xxxxxx-xx-xxxx', separator: '-')]
              : [],
          keyboardType: needsFormatting != null && needsFormatting == true
              ? TextInputType.number
              : null,
          decoration: InputDecoration(
              suffixIcon: hasSuffix != null
                  ? Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.red,
                    )
                  : null,
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              hintText: hintText),
          validator: (value) {
            return validatorFunction(value);
          },
        ),
      ],
    );
  }
}

class DateField extends StatefulWidget {
  const DateField(
      {Key? key,
      required this.hintText,
      required this.label,
      required this.textEditingController,
      required this.validatorFunction})
      : super(key: key);
  final String label;
  final String hintText;
  final TextEditingController textEditingController;
  final Function(String?) validatorFunction;
  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  DateTime selectedDate = DateTime.now();
  DateFormat formatter = DateFormat('dd-MM-yyyy');
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
        TextFormField(
          onTap: () {
            _selectDate(context);
          },
          readOnly: true,
          controller: widget.textEditingController,
          decoration: InputDecoration(
              errorMaxLines: 2,
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              suffixIcon: const Icon(
                Icons.calendar_month,
                color: Colors.red,
              ),
              hintText: widget.hintText),
          validator: (value) {
            return widget.validatorFunction((value));
          },
        ),
      ],
    );
  }

  Future _selectDate(BuildContext context) async {
    //specifies day/month/year format

    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.textEditingController.value = TextEditingValue(
            text: formatter.format(
                picked)); //Use formatter to format selected date and assign to text field
      });
    }
  }
}
