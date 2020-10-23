
class WebNotificationRequest {
WebNotificationRequest({
this.userId,
this.isRead,
});

String userId;
bool isRead;

factory WebNotificationRequest.fromMap(Map<String, dynamic> json) => WebNotificationRequest(
userId: json["userId"],
isRead: json["isRead"],
);

Map<String, dynamic> toMap() => {
"userId": userId,
"isRead": isRead,
};
}