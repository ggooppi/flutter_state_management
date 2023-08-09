import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:state_management_using_provider/utils/util.dart';

import 'model/notification.dart';
import 'repo/repository.dart';

class BaseViewModel extends ChangeNotifier {
  var _selectedScreenIndex = 0;
  bool _showProgress = true;

  BaseViewModel() {
    getData();
  }

  Future<File> get _localFile async {
    final path = await Util.localPath;
    return File('$path/notifications.json');
  }

  Future<void> writeData(String dataFromResource) async {
    File file = await _localFile;
    file.writeAsString(dataFromResource);
    _showProgress = false;
    notifyListeners();
  }

  bool get isProcessing {
    return _showProgress;
  }

  void updateSelectedScreen(int index) {
    _selectedScreenIndex = index;
    notifyListeners();
  }

  Future<void> getData() async {
    String dataFromResource = await Repository.loadAssetData();
    writeData(dataFromResource);
  }

  Future<List<Data>> getNotifications() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      final decodedResponse = jsonDecode(contents);

      final notifications = NotificationData.fromJson(decodedResponse);

      return notifications.data ?? [];
    } catch (e) {
      return [];
    }
  }

  int get selectedScreenIndex {
    return _selectedScreenIndex;
  }
}
