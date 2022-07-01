import 'package:e_remit/utils/static_data.dart';
import 'package:flutter/material.dart';

class LanguageIconButton extends StatefulWidget {
  const LanguageIconButton({
    Key? key,
  }) : super(key: key);

  @override
  State<LanguageIconButton> createState() => _LanguageIconButtonState();
}

class _LanguageIconButtonState extends State<LanguageIconButton> {
  Language _lang = languageList[0];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showLanguageDialog(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                        image: NetworkImage(
                          _lang.flagLogo,
                        ),
                        fit: BoxFit.cover)),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                _lang.shortForm,
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }

  showLanguageDialog(BuildContext context) {
    // set up the button

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialogBox(
          onTap: (index) {
            setState(() {
              _lang = languageList[index];
            });
          },
          currentLang: _lang.name,
        );
      },
    );
  }
}

class AlertDialogBox extends StatelessWidget {
  const AlertDialogBox(
      {Key? key, required this.onTap, required this.currentLang})
      : super(key: key);
  final Function(int index) onTap;
  final String currentLang;
  final bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      insetPadding: EdgeInsets.zero,
      title: SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Preffered Language",
              style: TextStyle(fontSize: 17),
            ),
            Text(
              "Language can be changed in settings when required",
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.normal),
            )
          ],
        ),
      ),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.8,
        child: ListView.builder(
            itemCount: languageList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  onTap(index);
                  Navigator.pop(context);
                },
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                  shape:
                      Border(bottom: BorderSide(color: Colors.grey.shade300)),
                  title: Text(languageList[index].name),
                  leading: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                            image: NetworkImage(
                              languageList[index].flagLogo,
                            ),
                            fit: BoxFit.cover)),
                  ),
                  trailing: currentLang == languageList[index].name
                      ? Checkbox(
                          shape: const CircleBorder(),
                          activeColor: Colors.green,
                          value: true,
                          onChanged: (value) {})
                      : null,
                ),
              );
            }),
      ),
    );
  }
}
