import 'package:e_remit/ui/personal_details/providers/details_provider.dart';
import 'package:e_remit/utils/field_validator.dart';
import 'package:e_remit/utils/static_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchableField extends StatefulWidget {
  const SearchableField({Key? key, required this.validatorFunction})
      : super(key: key);
  final Function(String?) validatorFunction;
  @override
  _SearchableFieldState createState() => _SearchableFieldState();
}

class _SearchableFieldState extends State<SearchableField> {
  bool isSearching = false;
  List<String> searchedList = [];
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.55,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: TextFormField(
                controller: _searchController,
                validator: (value) {
                  return widget.validatorFunction(value);
                },
                decoration: const InputDecoration(
                    hintText: 'Search nationality by name',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.red,
                    ),
                    border: InputBorder.none),
                onChanged: (value) {
                  setState(() {
                    isSearching = true;
                  });

                  searchNationality(capitalize(_searchController.text));
                },
              ),
            ),
            !isSearching
                ? const NationalityList()
                : SearchedNationalityList(searchedList: searchedList)
          ],
        ),
      ),
    );
  }

  searchNationality(value) {
    List<String> result = [];
    for (int i = 0; i < nationalityList.length; i++) {
      if (nationalityList[i].contains(value)) {
        result.add(nationalityList[i]);
      }
    }

    setState(() {
      searchedList = result;
    });
    print(result);
  }
}

class SearchedNationalityList extends StatelessWidget {
  const SearchedNationalityList({
    Key? key,
    required this.searchedList,
  }) : super(key: key);

  final List<String> searchedList;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
          itemCount: searchedList.length,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () {
                context
                    .read<DetailsProvider>()
                    .changeNationality(searchedList[index]);
                Navigator.pop(context);
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/nepalflag.png'),
                ),
                title: Text(searchedList[index]),
              ),
            );
          })),
    );
  }
}

class NationalityList extends StatelessWidget {
  const NationalityList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
          itemCount: nationalityList.length,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () {
                context
                    .read<DetailsProvider>()
                    .changeNationality(nationalityList[index]);
                Navigator.pop(context);
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/nepalflag.png'),
                ),
                title: Text(nationalityList[index]),
              ),
            );
          })),
    );
  }
}
