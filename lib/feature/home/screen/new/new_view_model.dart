import 'dart:convert';

import 'package:state_management_using_provider/feature/home/mixin/compare_list.dart';

import '../../base_view_model.dart';
import '../../model/notification.dart';

class NewViewModel extends BaseViewModel
    with CompareList
    implements NotificationHandler {
  bool _showProgress = true;

  List<Data> _newNotifications = [];

  NewViewModel() {
    readData();
  }

  @override
  bool get isProcessing {
    return _showProgress;
  }

  @override
  void readData() async {
    final data = await getNotifications();
    final newData = data.where((element) => element.isRead == false).toList();

    final newDataMap = newData.map((e) => e.toJson()).toList();
    final oldDataMap = _newNotifications.map((e) => e.toJson()).toList();

    if (!compare(newDataMap, oldDataMap)) {
      _newNotifications = newData;
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
    oldData[index].isRead = true;
    final map = {'data': oldData};
    await writeData(json.encode(map));

    readData();
  }

  List<Data> get notificationData {
    return _newNotifications;
  }
}
