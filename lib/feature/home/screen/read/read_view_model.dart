import 'dart:convert';

import 'package:state_management_using_provider/feature/home/mixin/compare_list.dart';

import '../../base_view_model.dart';
import '../../model/notification.dart';

class ReadViewModel extends BaseViewModel
    with CompareList
    implements NotificationHandler {
  bool _showProgress = true;

  List<Data> _readNotifications = [];

  ReadViewModel() {
    readData();
  }

  @override
  bool get isProcessing {
    return _showProgress;
  }

  @override
  void readData() async {
    final data = await getNotifications();
    final newData = data.where((element) => element.isRead == true).toList();

    final newDataMap = newData.map((e) => e.toJson()).toList();
    final oldDataMap = _readNotifications.map((e) => e.toJson()).toList();

    if (!compare(newDataMap, oldDataMap)) {
      _readNotifications = newData;
      _showProgress = false;
      notifyListeners();
    }
  }

  @override
  void updateData(Data data) async {
    _showProgress = true;
    notifyListeners();
    final oldData = await getNotifications();
    final index = oldData.indexWhere((element) => element.id == data.id);
    oldData[index].isRead = false;
    final map = {'data': oldData};
    await writeData(json.encode(map));

    readData();
  }

  List<Data> get notificationData {
    return _readNotifications;
  }
}
