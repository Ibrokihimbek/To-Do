import 'package:flutter/cupertino.dart';
import 'package:note/local_data/storage_repository.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isLight = StorageRepository.getBool("isLight");

  setIsLight(bool isLight) async {
    _isLight = isLight;
    await StorageRepository.saveBool("isLight", _isLight);
    notifyListeners();
  }

  getIsLight() {
    return _isLight;
  }
}