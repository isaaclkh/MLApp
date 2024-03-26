
import 'dart:async';

import 'package:flutter/foundation.dart';

class UrineCollectionProvider extends ChangeNotifier{
  bool _collectionStart = false;
  final _streamController = StreamController<bool>();

  bool get collectionStart => _collectionStart;

  set collectionStart(bool x){
    _collectionStart = x;
    notifyListeners();
  }

  Stream<bool> get collectionStartStream => _streamController.stream;

}