abstract class NotificationHandler {
  void readData();
  void updateData(Data data);
}

class NotificationData {
  List<Data>? data;

  NotificationData({this.data});

  NotificationData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? notificationText;
  bool? isRead;

  Data({this.id, this.notificationText, this.isRead});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    notificationText = json['notificationText'];
    isRead = json['isRead'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['notificationText'] = this.notificationText;
    data['isRead'] = this.isRead;
    return data;
  }
}
