import 'package:flutter/material.dart';

class SecondPageViewModel extends ChangeNotifier {
  late String info ='' ;
  late String profileLink='';
  List<String> selectedLanguages = [];
  List<String> availableLanguages = [
    'English',
    'Spanish',
    'French',
    'German',
    'Chinese',
    'Japanese',
    'Turkish',
    'Irish',
  ];


  bool isInfoValid() {
    return info.trim().isNotEmpty;
  }

  bool isProfileLinkValid() {
    return profileLink.trim().isNotEmpty;
  }

  bool isLanguageSelected(String language) {
    return selectedLanguages.contains(language);
  }

  void toggleLanguage(String language) {
    if (selectedLanguages.contains(language)) {
      selectedLanguages.remove(language);
    } else {
      if (selectedLanguages.length < 6) {
        selectedLanguages.add(language);
      } else {
        // Notify user that maximum languages are selected
        print('Maximum languages (6) already selected.');
      }
    }
    notifyListeners();
  }
  List<String> getSelectedLanguages() {
    return availableLanguages.where((language) => selectedLanguages.contains(language)).toList();
  }

  void setInfo(String value) {
    info = value;
    notifyListeners();
  }

  void setProfileLink(String? value) {
    profileLink = value!;
    notifyListeners();
  }
}
