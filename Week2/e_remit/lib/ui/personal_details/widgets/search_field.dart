import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

class SearchableField extends StatefulWidget {
  const SearchableField({Key? key, required this.validatorFunction})
      : super(key: key);
  final Function(String?) validatorFunction;
  @override
  _SearchableFieldState createState() => _SearchableFieldState();
}

class _SearchableFieldState extends State<SearchableField> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            "Nationality",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey.shade700),
          ),
        ),
        SearchField(
          validator: (value) {
            return widget.validatorFunction(value);
          },
          marginColor: Colors.grey.shade300,
          hint: 'Search country by name',
          searchInputDecoration: const InputDecoration(
            // contentPadding: EdgeInsets.symmetric(horizontal: 10),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
          ),
          maxSuggestionsInViewPort: 4,
          itemHeight: 50,
          suggestionsDecoration: const BoxDecoration(
            color: Colors.white,
          ),
          onSubmit: (value) {
            setState(() {
              _selectedItem = value;
            });

            print(value);
          },
          suggestions: <String>[
            'Afghanistan',
            'Turkey',
            'Germany',
            'France',
            'Italy',
            'Spain',
            'United Kingdom',
            'United States',
            'Canada',
            'Australia',
            'New Zealand',
            'India',
            'Indonesia',
            'Bangladesh',
            'Sri Lanka',
          ]
              .map((e) => SearchFieldListItem(e,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/nepalflag.png'),
                                fit: BoxFit.cover)),
                      ),
                      Text(
                        e,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )))
              .toList(),
        ),
      ],
    );
  }
}
