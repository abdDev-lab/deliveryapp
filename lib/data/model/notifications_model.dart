class NotificationsModel {
  int? notificationsId;
  String? notificationsTitle;
  String? notificationsBody;
  int? notificationsUserid;
  int? notificationsRead;
  String? notificationsDatetime;

  NotificationsModel(
      {this.notificationsId,
      this.notificationsTitle,
      this.notificationsBody,
      this.notificationsUserid,
      this.notificationsRead,
      this.notificationsDatetime});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    notificationsId = json['notifications_id'];
    notificationsTitle = json['notifications_title'];
    notificationsBody = json['notifications_body'];
    notificationsUserid = json['notifications_userid'];
    notificationsRead = json['notifications_read'];
    notificationsDatetime = json['notifications_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notifications_id'] = this.notificationsId;
    data['notifications_title'] = this.notificationsTitle;
    data['notifications_body'] = this.notificationsBody;
    data['notifications_userid'] = this.notificationsUserid;
    data['notifications_read'] = this.notificationsRead;
    data['notifications_datetime'] = this.notificationsDatetime;
    return data;
  }
}